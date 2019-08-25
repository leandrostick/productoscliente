package com.mercadolibre.itacademy

import grails.converters.JSON
import grails.validation.ValidationException
import groovy.json.JsonSlurper

import static org.springframework.http.HttpStatus.*

class SitioController {

    SitioService sitioService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(){

    }

    def indexM() {

        // ------- TRAEMOS LAS MARCAS
        def url = new URL("http://localhost:8080/marcas")
        def connection = (HttpURLConnection) url.openConnection()
        connection.setRequestMethod("GET")
        connection.setRequestProperty("Accept","application/json")
        connection.setRequestProperty("User-Agent","Mozilla/5.0")
        JsonSlurper json = new JsonSlurper()
        def marcas = json.parse(connection.getInputStream())
        render([marcas:marcas]as JSON)


    }
    def indexA(){
        // ------- TRAEMOS TODOS LOS ARTICULOS
        def url2 = new URL("http://localhost:8080/articulos")
        def connection2 = (HttpURLConnection) url2.openConnection()
        connection2.setRequestMethod("GET")
        connection2.setRequestProperty("Accept","application/json")
        connection2.setRequestProperty("User-Agent","Mozilla/5.0")
        JsonSlurper json2 = new JsonSlurper()
        def articulos = json2.parse(connection2.getInputStream())
        render([articulos:articulos] as JSON)
    }
    def indexAid(String id){
        // ------- TRAEMOS TODOS LOS ARTICULOS POR ID DE MARCA
        def url2 = new URL("http://localhost:8080/marcas/" + id + "/articulos")
        def connection2 = (HttpURLConnection) url2.openConnection()
        connection2.setRequestMethod("GET")
        connection2.setRequestProperty("Accept","application/json")
        connection2.setRequestProperty("User-Agent","Mozilla/5.0")
        JsonSlurper json2 = new JsonSlurper()
        def articulos = json2.parse(connection2.getInputStream())
        render([articulos:articulos] as JSON)
    }

    def article(String id){
        // -------- TRAEMOS UN ARTICULO POR SU ID
        String s = "http://localhost:8080/articulos/" + id
        def url = new URL(s)
        def connection = (HttpURLConnection) url.openConnection()
        connection.setRequestMethod("GET")
        connection.setRequestProperty("Accept","application/json")
        connection.setRequestProperty("User-Agent","Mozilla/5.0")
        JsonSlurper json = new JsonSlurper()
        def articulo = json.parse(connection.getInputStream())
        render([articulo:articulo] as JSON)
    }


    def deleteArticle(String id){


        // ------ ELiminamos un art por su id
        String s = "http://localhost:8080/articulos/" + id
        def url = new URL(s)
        def connection = (HttpURLConnection) url.openConnection()
        connection.setRequestMethod("DELETE")
        connection.setRequestProperty("Accept","application/json")
        connection.setRequestProperty("User-Agent","Mozilla/5.0")
        JsonSlurper json = new JsonSlurper()
        def articulo = json.parse(connection.getInputStream())

        render([articulo:articulo] as JSON)
    }

    def show(Long id) {
        respond sitioService.get(id)
    }

    def create() {
        respond new Sitio(params)
    }

    def save(Sitio sitio) {
        if (sitio == null) {
            notFound()
            return
        }

        try {
            sitioService.save(sitio)
        } catch (ValidationException e) {
            respond sitio.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'sitio.label', default: 'Sitio'), sitio.id])
                redirect sitio
            }
            '*' { respond sitio, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond sitioService.get(id)
    }

    def update(Sitio sitio) {
        if (sitio == null) {
            notFound()
            return
        }

        try {
            sitioService.save(sitio)
        } catch (ValidationException e) {
            respond sitio.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'sitio.label', default: 'Sitio'), sitio.id])
                redirect sitio
            }
            '*'{ respond sitio, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        sitioService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'sitio.label', default: 'Sitio'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'sitio.label', default: 'Sitio'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
