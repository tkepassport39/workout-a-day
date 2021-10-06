const workouts = require('./workoutList.json')
var prompt = require('prompt');

function getRandomInt(max) {
    return Math.floor(Math.random() * max);
  }


function getWorkoutDetails (exercise) {

    const workout = getRandomInt(exercise.exerciseList.length)

    // what the user should see 
    console.log("workout name : " + exercise.exerciseList[workout].name)
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
        console.log("-------------")
    });
    
}

// const jsonString = JSON.stringify(workouts.bigMuscleGroup[0].exercise[0], null, 2)


// display group muscle names
// getMuscleGroupList(workouts)

// // display list of all big /small muscles
// getMuscleList(workouts[0].muscleList)

// // display workout name along with reps and sets
// getWorkoutDetails(workouts[0].muscleList[1])

// format into message to show the muscle group

//
// Start the prompt
//
prompt.start();

// welcome message
console.log("Welcome! Choose a muscle group:\n0) Big Muscle Group\n1) Small Muscle Group\n")

//
// Get two properties from the user: username and email
//
prompt.get(['Muscle Group'], function (err, result) {

    userInput = result['Muscle Group']
    //console.log('  Muscle Group: ' + userInput);
    
    // dislay muscle group lists
    getMuscleList(workouts[userInput].muscleList)

    prompt.get(['Muscle list'], function (err, result) {

        console.log(result['Muscle list'])
        let i = 0
        
        // display the exercises
        do {
            
            i += 1
            getWorkoutDetails(workouts[userInput].muscleList[result['Muscle list']])

            // think about async await
            // prompt.get(['quit'], function (err, result) {
            //     console.log(result['quit'])
            //     break;
            // }

        } while (i < 3)
        
        // for(let i=0; i <3; i++){

        //     getWorkoutDetails(workouts[userInput].muscleList[result['Muscle list']])
        
        // }

    })

});