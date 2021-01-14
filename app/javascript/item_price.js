window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    const proFit = document.getElementById("profit");
    addTaxDom.innerHTML = `${inputValue*0.1}`;
    proFit.innerHTML = `${inputValue*0.9}`;

    
  })
});

