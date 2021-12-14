import { Component, Input, OnInit } from '@angular/core';
import { degrees, PDFDocument, rgb, StandardFonts } from 'pdf-lib';
import axios from 'axios';
import { AuthService } from 'src/app/services/auth.service';

@Component({
  selector: 'app-matricula-item',
  templateUrl: './matricula-item.component.html',
  styleUrls: ['./matricula-item.component.scss']
})
export class MatriculaItemComponent implements OnInit {

  enviada = true;


  @Input() matriculaUser;

  constructor(private authService: AuthService) { }

  ngOnInit(): void {
    this.modifyPdf();
    console.log("MATRICULA USER: "+this.matriculaUser)
  }

  openModal() {
    
  }

  deleteMatricula(id){
    axios
      .delete(`${this.authService.url}/matriculas/${id}`)
      .then(response => {
        console.log('Well done!');
      })
      .catch(error => {
        // Handle error.
        console.log('An error occurred:', error.response);
      });
  }

  enviarMatricula(id){
    axios
      .post(`${this.authService.url}/matriculas/${id}`, {
        enviada: true
      })
      .then(response => {
        console.log('Well done!');
      })
      .catch(error => {
        // Handle error.
        console.log('An error occurred:', error.response);
      });
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
}
