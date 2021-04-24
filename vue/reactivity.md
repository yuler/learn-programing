# Reactivity

## Refs:

- https://v3.vuejs.org/guide/reactivity.html
- https://www.vuemastery.com/courses/vue-3-reactivity/vue3-reactivity
- https://github.com/Code-Pop/vue-3-reactivity

## How reactivity

```js
// Define dep track & trigger
const targetMap = new WeakMap()

function track(target, key) {
  let depsMap = targetMap.get(target)
  if (!depsMap) {
    targetMap.set(target, (depsMap = new Map()))
  }
  let dep = depsMap.get(key)
  if (!dep) {
    depsMap.set(key, (dep = new Set()))
  }
  dep.add(effect)
}

function trigger(target, key) {
  const depsMap = targetMap.get(target)
  if (!depsMap) return
  const dep = depsMap.get(key)
  if (dep) {
    dep.forEach(effect => effect())
  }
}

// Run Example
let product = { price: 5, quantity: 2 }
let total = 0
let effect = () => {
  total = product.price * product.quantity
}

track(product, 'quantity')
effect()
console.log(total) // --> 10

product.quantity = 3
trigger(product, 'quantity')
console.log(total) // --> 15
```

## Proxy & Reflect

https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Proxy

```js
// Define reactive
function reactive(target) {
  const handler = {
    get(target, key, receiver) {
      let result = Reflect.get(target, key, receiver)
      track(target, key)
      return result
    },
    set(target, key, value, receiver) {
      let oldValue = target[key]
      let result = Reflect.set(target, key, value, receiver)
      if (result && oldValue != value) {
        trigger(target, key)
      }
      return result
    }
  }
  return new Proxy(target, handler)
}

// Run Example
let product = reactive({ price: 5, quantity: 2 })
let total = 0
let effect = () => {
  total = product.price * product.quantity
}

effect()
console.log(total) // --> 10

product.quantity = 3
console.log(total) // --> 15
```

## ActiveEffect

console.log(product.quantity)  // record `track`

```js
let activeEffect = null

function effect(fn) {
  activeEffect = fn
  activeEffect()
  activeEffect = null
}
```

Update `track` function 

```js
let activeEffect = null

function track(target, key) {
  if (activeEffect) {
    let depsMap = targetMap.get(target)
    if (!depsMap) {
      targetMap.set(target, (depsMap = new Map()))
    }
    let dep = depsMap.get(key)
    if (!dep) {
      depsMap.set(key, (dep = new Set()))
    }
    dep.add(activeEffect)
  }
}
```

```js
let product = reactive({ price: 5, quantity: 2 })
let salePrice = 0
let total = 0

effect(() => {
  total = product.price * product.quantity
})
effect(() => {
  salePrice = product.price * 0.9
})

console.log(
  `Before update total (should be 10) = ${total} salePrice (should be 4.5) = ${salePrice}`
)
product.quantity = 3
console.log(
  `After updated total (should be 15) = ${total} salePrice (should be 4.5) = ${salePrice}`
)
```

## Ref

Simple way

```js
function ref(intialValue) {
  return reactive({ value: intialValue })
}
```

```js
function ref(raw) {
  const r = {
    get value() {
      track(r, 'value')
      return raw
    },
    set value(newVal) {
      raw = newVal
      trigger(r, 'value')
    }
  }
  return r
}
```

```js
let product = reactive({ price: 5, quantity: 2 })
let salePrice = ref(0)
let total = 0

effect(() => {
  salePrice.value = product.price * 0.9
})
effect(() => {
  total = salePrice.value * product.quantity
})

console.log(
  `Before update total (should be 10) = ${total} salePrice (should be 4.5) = ${salePrice}`
)
product.quantity = 3
console.log(
  `After updated total (should be 13.5) = ${total} salePrice (should be 4.5) = ${salePrice}`
)
product.price = 10
console.log(
  `After updated total (should be 27) = ${total} salePrice (should be 9) = ${salePrice}`
)
```

## Computed

```js
function computed(getter) {
  let result = ref()

  effect(() => (result.value = getter()))

  return result
}
```

## Souce code

```bash
yarn install
yarn build reactivity
cp packages/dist/reactivity.cjs.js ./_tests
```

```js
require('./reactivity.cjs')

// Write some code
```

