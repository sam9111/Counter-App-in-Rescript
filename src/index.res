@val external document: {..} = "document"
@val external window: {..} = "window"

let plusButton = document["getElementById"]("plus-one")
let minusButton = document["getElementById"]("minus-one")
window["count"] = 0

let counterText = document["getElementById"]("count")

let updateCount = steps => {
  window["count"] = steps + window["count"]
}
let updateCounterCSS = () => {
  if window["count"] > 0 {
    counterText["className"] = "count count-positive"
  } else if window["count"] < 0 {
    counterText["className"] = "count count-negative"
  } else {
    counterText["className"] = "count count-zero"
  }
}

let renderCountView = () => {
  counterText["innerText"] = `Count is ${window["count"]}`
}

let renderView = steps => {
  updateCount(steps)
  updateCounterCSS()
  renderCountView()
}

let plusOne = () => renderView(1)
let minusOne = () => renderView(-1)

plusButton["addEventListener"]("click", plusOne)
minusButton["addEventListener"]("click", minusOne)
