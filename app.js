const workouts = require('./workoutList.json')


function getWorkoutDetails (exercise) {

    // what the user should see 
    console.log("workout name : " + exercise.name)
    console.log("# Sets : " + exercise.sets)
    console.log("# Reps : " + exercise.reps)
}

function getMuscleGroupList (muscleGroup){

    muscleGroup.forEach(element => {
        console.log("Here is the list of muscles : " + element.muscle)
    });
    
}

const jsonString = JSON.stringify(workouts.bigMuscleGroup[0].exercise[0], null, 2)


getWorkoutDetails(workouts.bigMuscleGroup[0].exercise[0])

//console.log(workouts.bigMuscleGroup)
// display list of all big /small muscles
getMuscleGroupList(workouts.bigMuscleGroup)

// display muscles in a muscle group

// display list of muscles

// get list of muscles

// display list of exercises

// get list of exercises