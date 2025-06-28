from django.apps import AppConfig
import os
from django.conf import settings
from cryptography.hazmat.primitives.asymmetric import rsa
from cryptography.hazmat.primitives import serialization


class ModuloRegistroConfig(AppConfig):
    default_auto_field = 'django.db.models.BigAutoField'
    name = 'modulo_registro'

    def ready(self):
        key_dir = os.path.join(settings.BASE_DIR, 'keys')
        os.makedirs(key_dir, exist_ok=True)

        private_key_path = os.path.join(key_dir, 'clave_privada.pem')
        public_key_path = os.path.join(key_dir, 'clave_publica.pem')

        if not os.path.exists(private_key_path):
            private_key = rsa.generate_private_key(public_exponent=65537, key_size=2048)

            with open(private_key_path, 'wb') as f:
                f.write(private_key.private_bytes(
                    encoding=serialization.Encoding.PEM,
                    format=serialization.PrivateFormat.PKCS8,
                    encryption_algorithm=serialization.NoEncryption()
                ))

            with open(public_key_path, 'wb') as f:
                f.write(private_key.public_key().public_bytes(
                    encoding=serialization.Encoding.PEM,
                    format=serialization.PublicFormat.SubjectPublicKeyInfo
                ))

            print("Claves RSA generadas automáticamente al iniciar el sistema.")
        else:
            print("Claves RSA ya existen. No se regeneran.")
