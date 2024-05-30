<script>
    export let invoice;

    import invoiceLogo from '../invoice-logo.png';
</script>

<style>
    #invoice-preview {
        width: 210mm;
        min-height: 297mm;
        padding: 30mm;
        font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
        border: 1px solid #e0e0e0;
        background-color: #ffffff;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        margin: 20px auto;
        border-radius: 12px;
        box-sizing: border-box;
    }
    h1 {
        text-align: center;
        color: #333;
        font-size: 24px;
        margin-bottom: 20px;
    }
    p {
        font-size: 16px;
        color: #666;
        margin-bottom: 10px;
    }
    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }
    th, td {
        border: 1px solid #ddd;
        padding: 12px;
        text-align: left;
        font-size: 16px;
    }
    th {
        background-color: #f8f8f8;
        color: #333;
    }
    tr:nth-child(even) {
        background-color: #f9f9f9;
    }
    tr:hover {
        background-color: #f1f1f1;
    }
</style>

<div id="invoice-preview">
    <h1>Invoice</h1>
    <p>Date: {invoice.date}</p>
    <p>Invoice Number: {invoice.number}</p>
    <table>
        <thead>
            <tr>
                <th>Description</th>
                <th>Quantity</th>
                <th>Price</th>
                <th>Total</th>
            </tr>
        </thead>
        <tbody>
            {#each invoice.items as item}
                <tr>
                    <td>{item.description}</td>
                    <td>{item.quantity}</td>
                    <td>{item.price}</td>
                    <td>{item.quantity * item.price}</td>
                </tr>
            {/each}
        </tbody>
    </table>
</div>
