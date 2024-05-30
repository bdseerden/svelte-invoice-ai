<script>
    export let invoice;
    const addItem = () => {
        invoice = {
            ...invoice,
            items: [...invoice.items, { description: '', quantity: 1, price: 0 }]
        };
    };
    const removeItem = (index) => {
        invoice = {
            ...invoice,
            items: invoice.items.filter((_, i) => i !== index)
        };
    };
</script>

<style>
    form {
        display: flex;
        flex-direction: column;
        gap: 20px;
        max-width: 800px;
        margin: 20px auto;
        padding: 20px;
        background: white;
        border-radius: 12px;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
    }
    label {
        font-size: 16px;
        color: #333;
    }
    input[type="text"], input[type="date"], input[type="number"] {
        padding: 12px;
        border: 1px solid #ddd;
        border-radius: 8px;
        font-size: 16px;
        width: 100%;
    }
    button {
        padding: 12px 20px;
        border: none;
        border-radius: 8px;
        background-color: #007bff;
        color: white;
        cursor: pointer;
        font-size: 16px;
        transition: background-color 0.3s;
    }
    button:hover {
        background-color: #0056b3;
    }
</style>

<form on:submit|preventDefault>
    <label>Date: <input type="date" bind:value={invoice.date} /></label>
    <label>Invoice Number: <input type="text" bind:value={invoice.number} /></label>
    {#each invoice.items as item, index}
        <div>
            <label>Description: <input type="text" bind:value={item.description} /></label>
            <label>Quantity: <input type="number" bind:value={item.quantity} /></label>
            <label>Price: <input type="number" bind:value={item.price} /></label>
            <button type="button" on:click={() => removeItem(index)} style="background-color: #dc3545; margin-top: 10px;">Remove</button>
        </div>
    {/each}
    <button type="button" on:click={addItem}>Add Item</button>
</form>
