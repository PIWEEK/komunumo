package komunumo

class Neighbourhood {

    String name
    Float latitude
    Float longitude
    City city

    static hasMany = [
        activities: Activity
    ]

    static constraints = {
        name (blank:false, unique:true)
        latitude (blank:true, nullable:true)
        longitude (blank:true, nullable:true)
    }
}
