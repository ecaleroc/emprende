$(document).ready(function () {
    alert("llego aqui");
  $("#basic-pills-wizard").bootstrapWizard({
    tabClass: "nav nav-pills nav-justified",
  }),
    $("#progrss-wizard").bootstrapWizard({
      onTabShow: function (a, i, s) {
        i = ((s + 1) / i.find("li").length) * 100;
        $("#progrss-wizard")
          .find(".progress-bar")
          .css({ width: i + "%" });
      },
    });
});
