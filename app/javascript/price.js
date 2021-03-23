function price(){
    const articleText = document.getElementById("item-price")
    articleText.addEventListener("keyup", () => {
    const price = articleText.value;
    const price_fee = Math.floor(price / 10);
    const price_profit = price - price_fee;
    const AddTaxPrice = document.getElementById("add-tax-price");
    AddTaxPrice.innerHTML = `${price_fee}`;
    const Profit = document.getElementById("profit");
    Profit.innerHTML = `${price_profit}`;
  });
};

window.addEventListener('load', price);