function price(){
  
  const priceInput = document.getElementById("item-price");
  
  priceInput.addEventListener("input", () => {
    
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = (Math.floor(inputValue * 0.1));
    
    const addTaxValue = (Math.floor(inputValue * 0.1));
    const profitValue = document.getElementById("profit");
    profitValue.innerHTML = (Math.floor(inputValue - addTaxValue));

    
  })
}

window.addEventListener('load', price)