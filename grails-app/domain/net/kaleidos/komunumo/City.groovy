package net.kaleidos.komunumo

class City {

    String name

    static hasMany = [
       neighbourhoods : Neighbourhood
    ]

    static constraints = {
        name (blank:false, unique:true)
    }
}
