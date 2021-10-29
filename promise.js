const workouts = require('./workoutList.json')
var prompt = require('prompt');

function getRandomInt(max) {
    return Math.floor(Math.random() * max);
  }

const previousWorkout = []

// store previous workouts in array
function resetWorkout () {
    
    // trick to reset a const array
    previousWorkout.length = 0
}



function getWorkoutDetails (exercise) {

    let workout 

    do{
        // get another random workout
        workout = getRandomInt(exercise.exerciseList.length)
        
    }
    while(previousWorkout.includes(workout))

    // record workout in array
    previousWorkout.push(workout)

    // what the user should see 
    console.log("\nworkout name : " + exercise.exerciseList[workout].name)
    console.log("# Sets : " + exercise.exerciseList[workout].sets)
    console.log("# Reps : " + exercise.exerciseList[workout].reps)
    console.log("-------------")

}

// get muscle list 
function getMuscleList (muscleGroup){
    console.log("Select which muscle:")
    console.log("-------------\n")
    muscleGroup.forEach((element, index) => {
        console.log(`${index}) ${element.muscle}`)

    });
    
}

function getMuscleGroupList (muscleGroup){

    muscleGroup.forEach(element => {
        console.log("Here is the list of group muscles : " + element.groupName)
        console.log("-------------\n")
    });
    
}

//
// Start the prompt
//
prompt.start();

function stuff () {

    // welcome message
    console.log("\nWelcome! Choose a muscle group:\n0) Big Muscle Group\n1) Small Muscle Group\n")

    return prompt.get(['muscleGroup'])
    .then( ({muscleGroup}) => {
    
        // console.log(muscleGroup)

        getMuscleList(workouts[muscleGroup].muscleList)

        return prompt.get(['muscleList'])
    
    })
    .then( ({muscleList}) => {

        // console.log(muscleList)
        let i = 0

        // // display the exercises
        do {
    
            i += 1

            let name = prompt.history('muscleGroup').value

            getWorkoutDetails(workouts[name].muscleList[muscleList])

        } while (i < 2)

        resetWorkout()

        return prompt.get(['done'])
    })
    .then( ({done}) => {
        if(done == 'n'){
            // promise needs to return something
            return stuff()    
        }
    })

}

stuff().then(() => console.log("\nHave a great day"))