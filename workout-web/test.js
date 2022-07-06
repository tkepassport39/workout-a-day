const { User , getTodayWorkout } = require('./classes')

// test User
async function testUser(){
    const a = await User.get("john@gmail.com")

    console.log(a)
    console.log(a instanceof User)

    // const kevin = await User.create("kevin@hotmail.com")
    // console.log(kevin)
}
testUser()

// async function testGetTodayWorkout(){
//     const workoutResult = await getTodayWorkout('melissa@gmail.com', ["bicep", "tricep"])
//     console.log(workoutResult)
// }
// testGetTodayWorkout()