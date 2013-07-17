package komunumo

class Entity {

    String name
    String address
    Float latitude
    Float longitude
    String web
    String telephone
    String zone
    String description
    String entityType

    static hasMany = [
        activities: Activity
    ]

    static constraints = {
        name (blank:false, unique:true)
        address (blank:true, nullable:true)
        latitude (blank:true, nullable:true)
        longitude (blank:true, nullable:true)
        web (blank:true, nullable:true)
        telephone (blank:true, nullable:true)
        zone (blank:true, nullable:true)
        description (blank:true, nullable:true)
        entityType (blank:true, nullable:true)
    }
	
	static mapping = {
		description type: 'text'
	}
}
