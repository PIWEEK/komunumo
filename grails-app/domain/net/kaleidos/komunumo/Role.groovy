package net.kaleidos.komunumo

class Role {

	String authority

	static mapping = {
		table 'role'
		cache true
	}

	static constraints = {
		authority blank: false, unique: true
	}
}
