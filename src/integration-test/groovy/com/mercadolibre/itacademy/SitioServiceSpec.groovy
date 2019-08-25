package com.mercadolibre.itacademy

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class SitioServiceSpec extends Specification {

    SitioService sitioService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new Sitio(...).save(flush: true, failOnError: true)
        //new Sitio(...).save(flush: true, failOnError: true)
        //Sitio sitio = new Sitio(...).save(flush: true, failOnError: true)
        //new Sitio(...).save(flush: true, failOnError: true)
        //new Sitio(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //sitio.id
    }

    void "test get"() {
        setupData()

        expect:
        sitioService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<Sitio> sitioList = sitioService.list(max: 2, offset: 2)

        then:
        sitioList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        sitioService.count() == 5
    }

    void "test delete"() {
        Long sitioId = setupData()

        expect:
        sitioService.count() == 5

        when:
        sitioService.delete(sitioId)
        sessionFactory.currentSession.flush()

        then:
        sitioService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        Sitio sitio = new Sitio()
        sitioService.save(sitio)

        then:
        sitio.id != null
    }
}
