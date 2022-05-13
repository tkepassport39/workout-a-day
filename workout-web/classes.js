const db_exercise = require("./data/exercise")
const db_focus = require("./data/focus")
const db_user_exercise_workout = require("./data/user-exercise-workout")
const db_user = require("./data/user")
const db_workout = require("./data/workout")

const numOfExercise = 3

class User {

    static async create(email) {
        // generate a new ID for the user
        const newID = db_user.length

        // create user and add to USER DB
        const newUser = {
            "id" : newID,
            "email" : email
        }

        db_user.push(newUser)

        // return the new user object
        return newUser
    }
    static async get(email){
        return db_user.find(element => element.email == email);
    }
    async update(){}
    async delete(){}
}

class UserExerciseWorkout {
    static async create(user, exercise, workout){
        console.log(JSON.stringify(user, null, 2))
        console.log(JSON.stringify(exercise, null, 2))
        console.log(JSON.stringify(workout, null, 2))
    }
    static async get(){}
    async update(){}
    async delete(){}
    static async find(user, exercise, workout){}
}

class Workout {
    constructor(id, name){
        this.id = id
        this.name = name
    }

    static async create(){
        // create workout in DB
        const dbID = 1
        // return new workout id
        return new Workout(dbID, "Anthony")
    }
    static async get(){}
    static async getLastWorkoutForUser(user){}
    async update(){
        console.log(this.workoutName)
    }
    async delete(){}
}

class Exercise {
    static async create(){}
    static async get(){}
    static async getFocus(focus){
        const saveExercise = []
        focus.forEach(element => {
            
            db_focus.forEach(i => {
                if(i.label == element){
                    saveExercise.push(i.exercise_id)
                }
            })
        });

        // return exercise objects
        saveExercise.map(exercise_id => db_exercise[exercise_id])
    }
    async update(){}
    async delete(){}
}

async function getTodayWorkout(userEmail, focus) {
    // need to get user from User class
    const user = await User.get(userEmail)

    // get the last workout for the user
    const lastWorkout = await Workout.getLastWorkoutForUser(user)

    // then get 6 exercises for 2 muscle groups
    const exercises = await getExercisesForFocusGroup(focus)

    // group exercises into a workout for the day
    const workout = await Workout.create()

    const userExerciseWorkouts = []

    for (const exercise of exercises) {
        userExerciseWorkouts.push(await UserExerciseWorkout.create(user, exercise, workout))
    }

    // return the workout
    return workout
}

async function getExercisesForFocusGroup(focus){
    // pass the label
    // hand back exercises
    const exercises = Exercise.getFocus(focus)

    // select three

    return exercises
}

async function saveReps(user, exercise, workout){
    // pull the workout

    // get the user

    // get the exercise

    // update reps in UserExerciseWorkout.Update() 

}

async function saveSets(user, exercise, workout){
    // pull the workout

    // get the user

    // get the exercise

    // update sets in UserExerciseWorkout.Update() 
}

async function saveWeight(user, exercise, workout){
    // pull the workout

    // get the user

    // get the exercise

    // update weight in UserExerciseWorkout.Update() 
}

module.exports = { 
    getTodayWorkout,
    Workout,
    User
}