package com.mercadolibre.itacademy

import grails.gorm.services.Service

@Service(Sitio)
interface SitioService {

    Sitio get(Serializable id)

    List<Sitio> list(Map args)

    Long count()

    void delete(Serializable id)

    Sitio save(Sitio sitio)

}