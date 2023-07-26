$(document).ready(function () {
    $("tr #btnDelete").click(function () {
        var idp = $(this).parent().find("#idp").val();
        swal({
            title: "¿Estás seguro?",
            text: "Una vez eliminado, se borrará de su carrito de compras!",
            icon: "warning",
            buttons: true,
            dangerMode: true
        })
                .then((willDelete) => {
                    if (willDelete) {
                        eliminar(idp);
                        swal("Ha eliminado el producto de su carrito con éxito!", {
                            icon: "success",
                        }).then((willDelete) => {
                            if (willDelete) {
                                parent.location.href = "Ctrlindex?accion=Carrito";
                            }
                        });
                    } else {
                        swal("Registro no eliminado!");
                    }
                });

    });

    function eliminar(idp) {
        var url = "Ctrlindex?accion=Delete";
        $.ajax({
            type: 'POST',
            url: url,
            data: "idp=" + idp,
            success: function (data, textStatus, jqXHR) {
            }
        });
    }

    $("#btnCompraVacio").click(function () {
        swal({
            icon: "warning",
            text: "No tienes ningún producto en tu carrito de compras.",
            button: false,
            timer: 2000
        });
    });



});