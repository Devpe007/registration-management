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

  deleteConfirmation(event) {
    if(this.redirect) return;

    event.stopImmediatePropagation();
    event.preventDefault();

    const item = this.element.getAttribute('data-item-name');

    const message = item === 'Classe' || item === 'Matéria' ? `${item} deletada com sucesso!` : `${item} deletado com sucesso!`;

    Swal.fire({
      title: "Você tem certeza?",
      text: "Você não poderá reverter isso!",
      icon: "warning",
      showCancelButton: true,
      confirmButtonColor: "#3085d6",
      cancelButtonColor: "#d33",
      cancelButtonText: "Cancelar",
      confirmButtonText: "Sim, deletar"
    }).then((result) => {
      if (result.isConfirmed) {
        Swal.fire({
          title: "Deletado!",
          text: message,
          icon: "success"
        }).then((result) => {
          if(result.isConfirmed) {
            this.redirect = true;
            this.element.click();
          };
        });
      }
    });
  };
}
