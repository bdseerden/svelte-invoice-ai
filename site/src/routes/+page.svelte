<script>
    let prompt = "";
  
    async function generateInvoice() {
      const response = await fetch("http://localhost:8080/process-invoice-prompt", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ prompt })
      });
      const blob = await response.blob();
      const url = window.URL.createObjectURL(blob);
      const a = document.createElement("a");
      a.style.display = "none";
      a.href = url;
      a.download = "invoice.pdf";
      document.body.appendChild(a);
      a.click();
      window.URL.revokeObjectURL(url);
    }
  </script>
  
  <main>
    <form on:submit|preventDefault={generateInvoice}>
      <textarea bind:value={prompt} placeholder="Enter your invoice prompt here..."></textarea>
      <button type="submit">Generate Invoice</button>
    </form>
  </main>
  