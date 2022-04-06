// let i = 0

// function stuff () {
//     setTimeout(function () {
//         console.log("hello")
//         setTimeout(function () {
//             console.log("goodbye")
//             i++
//             console.log(i)
//             if(i <3){
//                 stuff()
//             }

//         }, 1000)
//     }, 2000)

// }

// stuff()

function stuff2 () {

    return new Promise((resolve, reject) => {
        reject("whoops failed")
        resolve(5)
        console.log("inside stuff2")
    })
}

stuff2()
.then(data => console.log(data + 5))
.then( (data) => console.log(`hello ${data}`))
.catch( rej => {
    console.log(rej)
    throw "1st catch error"
    // return "Anthony"
} )
.then( () => console.log("bla"))
.catch( rej => console.log(`${rej} - rejected`))
console.log("hi")