let i = 0

function stuff () {
    setTimeout(function () {
        console.log("hello")
        setTimeout(function () {
            console.log("goodbye")
            i++
            console.log(i)
            if(i <3){
                stuff()
            }

        }, 1000)
    }, 2000)

}

stuff()