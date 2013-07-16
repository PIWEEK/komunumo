package komunumo



import org.junit.*
import grails.test.mixin.*

@TestFor(ActivityTypeController)
@Mock(ActivityType)
class ActivityTypeControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/activityType/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.activityTypeInstanceList.size() == 0
        assert model.activityTypeInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.activityTypeInstance != null
    }

    void testSave() {
        controller.save()

        assert model.activityTypeInstance != null
        assert view == '/activityType/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/activityType/show/1'
        assert controller.flash.message != null
        assert ActivityType.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/activityType/list'

        populateValidParams(params)
        def activityType = new ActivityType(params)

        assert activityType.save() != null

        params.id = activityType.id

        def model = controller.show()

        assert model.activityTypeInstance == activityType
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/activityType/list'

        populateValidParams(params)
        def activityType = new ActivityType(params)

        assert activityType.save() != null

        params.id = activityType.id

        def model = controller.edit()

        assert model.activityTypeInstance == activityType
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/activityType/list'

        response.reset()

        populateValidParams(params)
        def activityType = new ActivityType(params)

        assert activityType.save() != null

        // test invalid parameters in update
        params.id = activityType.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/activityType/edit"
        assert model.activityTypeInstance != null

        activityType.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/activityType/show/$activityType.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        activityType.clearErrors()

        populateValidParams(params)
        params.id = activityType.id
        params.version = -1
        controller.update()

        assert view == "/activityType/edit"
        assert model.activityTypeInstance != null
        assert model.activityTypeInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/activityType/list'

        response.reset()

        populateValidParams(params)
        def activityType = new ActivityType(params)

        assert activityType.save() != null
        assert ActivityType.count() == 1

        params.id = activityType.id

        controller.delete()

        assert ActivityType.count() == 0
        assert ActivityType.get(activityType.id) == null
        assert response.redirectedUrl == '/activityType/list'
    }
}
