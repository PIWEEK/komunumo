package komunumo

class ActivityType {

    String name

    static hasMany = [
        activities: Activity
    ]

    static constraints = {
        name (blank:false, unique:true)
    }
}
