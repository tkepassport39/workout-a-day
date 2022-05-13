const { User , getTodayWorkout } = require('./classes')

// test User
async function testUser(){

    const melissa = await User.get("melissa@gmail.com")
    console.log(melissa)
    
    const kevin = await User.create("kevin@hotmail.com")
    console.log(kevin)
}

testUser()

async function testGetTodayWorkout(){

    const workoutResult = await getTodayWorkout('melissa@gmail.com', ["bicep", "tricep"])
    console.log(workoutResult)
}

testGetTodayWorkout()