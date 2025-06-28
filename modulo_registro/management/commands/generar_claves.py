import os
from django.core.management.base import BaseCommand
from django.conf import settings

from cryptography.hazmat.primitives import serialization
from cryptography.hazmat.primitives.asymmetric import rsa


class Command(BaseCommand):
    help = 'Genera clave privada y clave pública para firma digital'

    def handle(self, *args, **kwargs):
        key_dir = os.path.join(settings.BASE_DIR, 'keys')
        os.makedirs(key_dir, exist_ok=True)

        private_key_path = os.path.join(key_dir, 'clave_privada.pem')
        public_key_path = os.path.join(key_dir, 'clave_publica.pem')

        if os.path.exists(private_key_path):
            self.stdout.write(self.style.WARNING('✔ La clave privada ya existe.'))
        else:
            private_key = rsa.generate_private_key(
                public_exponent=65537,
                key_size=2048,
            )

            # Guardar clave privada
            with open(private_key_path, 'wb') as f:
                f.write(private_key.private_bytes(
                    encoding=serialization.Encoding.PEM,
                    format=serialization.PrivateFormat.PKCS8,
                    encryption_algorithm=serialization.NoEncryption()
                ))
            self.stdout.write(self.style.SUCCESS(f'🔐 Clave privada creada en: {private_key_path}'))

            # Guardar clave pública
            public_key = private_key.public_key()
            with open(public_key_path, 'wb') as f:
                f.write(public_key.public_bytes(
                    encoding=serialization.Encoding.PEM,
                    format=serialization.PublicFormat.SubjectPublicKeyInfo
                ))
            self.stdout.write(self.style.SUCCESS(f'🔓 Clave pública creada en: {public_key_path}'))
