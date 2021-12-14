import { Component, Input, OnInit } from '@angular/core';
import { degrees, PDFDocument, rgb, StandardFonts } from 'pdf-lib';

@Component({
  selector: 'app-matricula-item',
  templateUrl: './matricula-item.component.html',
  styleUrls: ['./matricula-item.component.scss']
})
export class MatriculaItemComponent implements OnInit {

  enviada = true;


  @Input() matriculaUser;

  constructor() { }

  ngOnInit(): void {
    this.modifyPdf();
    console.log("MATRICULA USER: "+this.matriculaUser)
  }

  openModal() {
    
  }

  async modifyPdf() {

    //Fetch de un PDF que existe 
    const url = '../../../assets/pdf/1ESO_Ordinario.pdf'
    const existingPdfBytes = await fetch(url).then(res => res.arrayBuffer())
  
    //Plantilla de PDF
    const pdfDoc = await PDFDocument.load(existingPdfBytes)
    const helveticaFont = await pdfDoc.embedFont(StandardFonts.Helvetica)
  
    //Coge la la primera página
    const pages = pdfDoc.getPages()
    const firstPage = pages[0]

    //Coge el ancho y el alto de la primera página
    const { width, height } = firstPage.getSize()
    firstPage.drawText('This text was added with JavaScript!', {
      x: 5,
      y: height / 2 + 300,
      size: 50,
      font: helveticaFont,
      color: rgb(0.95, 0.1, 0.1),
      rotate: degrees(-45),
    })
  
    const pdfBytes = await pdfDoc.save();
    console.log(pdfBytes);
  }

  
  abrirBorrarModal(id) {
    const modal = document.getElementById(`modal-matricula-borrar-${id}`)
    modal.style.display = "flex";
    document.body.classList.add('stop-scrolling');
  }

  cerrarBorrarModal(id) {
    const modal = document.getElementById(`modal-matricula-borrar-${id}`)
    modal.style.display = "none";
    document.body.classList.remove('stop-scrolling');
  }

  abrirEnviarModal(id) {
    const modal = document.getElementById(`modal-matricula-enviar-${id}`)
    modal.style.display = "flex";
    document.body.classList.add('stop-scrolling');
  }

  cerrarEnviarModal(id) {
    const modal = document.getElementById(`modal-matricula-enviar-${id}`)
    modal.style.display = "none";
    document.body.classList.remove('stop-scrolling');
  }

  enviarMatricula(id) {
    this.cerrarEnviarModal(id);
  }

  borrarMatricula(id) {
    this.cerrarBorrarModal(id);
  }


}
