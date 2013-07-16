package komunumo

class Activity {

    String name
    Date activityDate
    String address
    String place
    Float latitude
    Float longitude
    String description
    Entity entity
    ActivityType activityType
    Neighbourhood neighbourhood

    static constraints = {
        name (blank:false, unique:true)
        place (blank:true, nullable:true)
        latitude (blank:true, nullable:true)
        longitude (blank:true, nullable:true)
    }
}
