class User {

    static async create() { }
    static async get(email){ }
    async update(){ }
    async delete(){ }
}

class UserExerciseWorkout {
    static async create(user, exercise, workout) { }
    static async get(){ }
    async update(){ }
    async delete(){ }
}

class Workout {
    static async create() { }
    static async get(){ }
    async update(){ }
    async delete(){ }
}

class Exercise {
    static async create() { }
    static async get(){ }
    async update(){ }
    async delete(){ }
}

async function getTodayWorkout(userEmail, muscles) {
    // need to get user from User class
    const user = await User.get(userEmail)

    // then get 6 exercises for 2 muscle groups
    const exercises = await getExercisesForMuscleGroup(muscles)

    // group exercises into a workout for the day
    const workout = await Workout.create()

    const userExerciseWorkouts = []

    for (const exercise of exercises) {
        userExerciseWorkouts.push(await UserExerciseWorkout.create(user, exercise, workout))
    }

    // return the workout
    return workout
}

async function getExercisesForMuscleGroup(muscles){ }

async function saveReps(user, exercise, workout){
    // pull the workout

    // get the user

    // get the exercise

    // update reps in UserExerciseWorkout.Update() 
}

