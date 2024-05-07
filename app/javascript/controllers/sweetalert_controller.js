import { Controller } from "@hotwired/stimulus"
import Swal from 'sweetalert2';
window.Swal = Swal;

export default class extends Controller {
  connect() {
    this.redirect = false;
  };

  successModal(event) {
    if (this.redirect) return;

    event.stopImmediatePropagation();
    event.preventDefault();

    Swal.fire({
      title: "Tem certeza?",
      showCancelButton: true,
      confirmButtonText: "Salvar",
    }).then((result) => {
      if (result.isConfirmed) {
        Swal.fire("Salvo com sucesso!", "", "success").then((result) => {
          if (result.isConfirmed) {
            this.redirect = true;
            this.element.click();
          }
        });

      } else if (result.isDenied) {
        Swal.fire("Erro ao salvar!", "", "info");
      }
    });
  }
}
