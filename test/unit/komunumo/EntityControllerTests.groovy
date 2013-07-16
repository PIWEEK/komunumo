package komunumo



import org.junit.*
import grails.test.mixin.*

@TestFor(EntityController)
@Mock(Entity)
class EntityControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/entity/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.entityInstanceList.size() == 0
        assert model.entityInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.entityInstance != null
    }

    void testSave() {
        controller.save()

        assert model.entityInstance != null
        assert view == '/entity/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/entity/show/1'
        assert controller.flash.message != null
        assert Entity.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/entity/list'

        populateValidParams(params)
        def entity = new Entity(params)

        assert entity.save() != null

        params.id = entity.id

        def model = controller.show()

        assert model.entityInstance == entity
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/entity/list'

        populateValidParams(params)
        def entity = new Entity(params)

        assert entity.save() != null

        params.id = entity.id

        def model = controller.edit()

        assert model.entityInstance == entity
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/entity/list'

        response.reset()

        populateValidParams(params)
        def entity = new Entity(params)

        assert entity.save() != null

        // test invalid parameters in update
        params.id = entity.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/entity/edit"
        assert model.entityInstance != null

        entity.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/entity/show/$entity.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        entity.clearErrors()

        populateValidParams(params)
        params.id = entity.id
        params.version = -1
        controller.update()

        assert view == "/entity/edit"
        assert model.entityInstance != null
        assert model.entityInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/entity/list'

        response.reset()

        populateValidParams(params)
        def entity = new Entity(params)

        assert entity.save() != null
        assert Entity.count() == 1

        params.id = entity.id

        controller.delete()

        assert Entity.count() == 0
        assert Entity.get(entity.id) == null
        assert response.redirectedUrl == '/entity/list'
    }
}
