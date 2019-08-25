<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main2" />
        <g:set var="entityName" value="${message(code: 'sitio.label', default: 'Sitio')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
        <script src="https://unpkg.com/vue"></script>
        <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    </head>
    <body>
<div class="container">
    <div id="content" role="main">
        <h1 class="titulo">Ropa y Accesorios</h1>
        <div id="productos" onload="productos.indexar()">


            <div class="row">
                Filtrar por marca:
                <select onchange="productos.indexarAid(this.value)">
                    <option :value="item.id" v-for="item of marcas" >
                        {{item.name}}
                    </option>
                </select>
            </div>

            <div class="row botones">
                <div class="col-12 col-sm-12 col-md-6 col-lg-4 col-xl-3" v-for="item of articulos">
                    <a href="#" @click="mostrarModal(item.id)"  >
                        <h2>{{item.name}}</h2>
                        <i><h5>{{item.marca}}</h5></i>
                        <p id="idActual" hidden >{{item.id}}</p>
                        <img :src="item.picture" />
                    </a>
                </div>
            </div>




            <!-- Modal -->
            <div class="modal fade" id="modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel"></h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body" id="modalBody">

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                            <button type="button" class="btn btn-primary" >Editar</button>
                            <button type="button" class="btn btn-danger"  @click="borrarArticulo()">Eliminar</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Modal -->

        </div>

    </div>
</div>





    <script>
        var productos = new Vue({
            el:'#productos',
            data:{
                marcas:[],
                articulos:[],
                articulo:[]
            },
            methods:{
                indexar: function () {
                    axios.get('/sitio/indexM')
                    .then(function (response) {
                        productos.marcas = response.data.marcas
                        console.log(this.marcas)
                    }).catch(function (error) {
                        console.log(error)
                    })
                    axios.get('/sitio/indexA')
                        .then(function (response) {
                            productos.articulos = response.data.articulos
                            console.log(this.articulos)
                        }).catch(function (error) {
                        console.log(error)
                    })
                },
                indexarAid: function (id) {
                    axios.get('/sitio/indexAid',{
                        params:{
                            id:id
                        }
                    }).then(function (response) {
                            productos.articulos = response.data.articulos
                            console.log(this.articulos)
                        }).catch(function (error) {
                        console.log(error)
                    })
                },
                mostrarModal: function (id) {
                    console.log("mostrarModal:")
                    console.log("id: " + id)
                    axios.get('/sitio/article',{
                        params:{
                            id:id
                        }
                    }).then(function (response) {
                        //Traemos el art
                        productos.articulo = response.data.articulo
                        console.log("Articulo  traido con exito: ")
                        console.log(productos.articulo.name + " " + productos.articulo.marca)

                        //Lo metemos al modal
                        document.getElementById('exampleModalLabel').innerText = productos.articulo.name
                        var body ='<p>' +  productos.articulo.name  + " " + productos.articulo.marca + '</p>'
                        var body = body + '<img id=\"imgModal\"/>'
                        document.getElementById('modalBody').innerHTML = body
                        var picture = productos.articulo.picture
                        document.getElementById('imgModal').setAttribute("src", picture)


                    }).catch(function (error) {
                        console.log("error  en  get articulo")
                        console.log(error)
                    })

                    //mostramos el modal
                    $('#modal').modal('show')
                },


                borrarArticulo: function () {
                    var id = productos.articulo.id
                    axios.delete('/sitio/deleteArticle',{
                        params:{
                            id:id
                        }
                    }).then(function (response) {
                        productos.articulo = response.data.articulo
                        console.log("Art borrado")
                    }).catch(function (error) {
                        console.log(error)
                    })
                }
            },


            created: function () {
                this.indexar()
            }
        })
    </script>
    </body>
</html>