package komunumo



import org.junit.*
import grails.test.mixin.*

@TestFor(NeighbourhoodController)
@Mock(Neighbourhood)
class NeighbourhoodControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/neighbourhood/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.neighbourhoodInstanceList.size() == 0
        assert model.neighbourhoodInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.neighbourhoodInstance != null
    }

    void testSave() {
        controller.save()

        assert model.neighbourhoodInstance != null
        assert view == '/neighbourhood/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/neighbourhood/show/1'
        assert controller.flash.message != null
        assert Neighbourhood.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/neighbourhood/list'

        populateValidParams(params)
        def neighbourhood = new Neighbourhood(params)

        assert neighbourhood.save() != null

        params.id = neighbourhood.id

        def model = controller.show()

        assert model.neighbourhoodInstance == neighbourhood
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/neighbourhood/list'

        populateValidParams(params)
        def neighbourhood = new Neighbourhood(params)

        assert neighbourhood.save() != null

        params.id = neighbourhood.id

        def model = controller.edit()

        assert model.neighbourhoodInstance == neighbourhood
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/neighbourhood/list'

        response.reset()

        populateValidParams(params)
        def neighbourhood = new Neighbourhood(params)

        assert neighbourhood.save() != null

        // test invalid parameters in update
        params.id = neighbourhood.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/neighbourhood/edit"
        assert model.neighbourhoodInstance != null

        neighbourhood.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/neighbourhood/show/$neighbourhood.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        neighbourhood.clearErrors()

        populateValidParams(params)
        params.id = neighbourhood.id
        params.version = -1
        controller.update()

        assert view == "/neighbourhood/edit"
        assert model.neighbourhoodInstance != null
        assert model.neighbourhoodInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/neighbourhood/list'

        response.reset()

        populateValidParams(params)
        def neighbourhood = new Neighbourhood(params)

        assert neighbourhood.save() != null
        assert Neighbourhood.count() == 1

        params.id = neighbourhood.id

        controller.delete()

        assert Neighbourhood.count() == 0
        assert Neighbourhood.get(neighbourhood.id) == null
        assert response.redirectedUrl == '/neighbourhood/list'
    }
}
