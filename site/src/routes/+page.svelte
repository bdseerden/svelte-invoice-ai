<script>
  import html2canvas from 'html2canvas';
  import jsPDF from 'jspdf';
  import InvoiceForm from '$lib/components/InvoiceForm.svelte';
  import InvoicePreview from '$lib/components/InvoicePreview.svelte';

  let invoice = {
      date: '',
      number: '',
      items: [{ description: '', quantity: 1, price: 0 }]
  };

  const generatePDF = async () => {
      const preview = document.getElementById('invoice-preview');
      const canvas = await html2canvas(preview, {
          scale: 2, // increase the scale for better resolution
          useCORS: true // enable cross-origin resource sharing if needed
      });
      const imgData = canvas.toDataURL('image/png');
      const pdf = new jsPDF('p', 'mm', 'a4');
      pdf.addImage(imgData, 'PNG', 0, 0, 210, 297); // ensure correct dimensions
      pdf.save('invoice.pdf');
  };
</script>

<style>
  .container {
      max-width: 1200px;
      margin: 0 auto;
      padding: 20px;
      font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
  }
  button.generate-pdf {
      display: block;
      margin: 20px auto;
      padding: 15px 30px;
      font-size: 18px;
      color: #fff;
      background-color: #28a745;
      border: none;
      border-radius: 8px;
      cursor: pointer;
      transition: background-color 0.3s;
  }
  button.generate-pdf:hover {
      background-color: #218838;
  }
</style>

<div class="container">
  <InvoiceForm bind:invoice={invoice} />
  <InvoicePreview {invoice} />
  <button class="generate-pdf" on:click={generatePDF}>Download PDF</button>
</div>
