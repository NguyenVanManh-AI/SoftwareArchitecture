<template>
    <div>
        <div class="modal fade" id="viewRecord" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
            aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">
                            View Detail Product </h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true" class="text-danger"><i class="fa-regular fa-circle-xmark"></i></span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <p><label for="exampleInputEmail1"><strong>Name Product</strong></label> : {{ recordSelected.name }}</p>
                        <p><label for="exampleInputEmail1"><strong>Price Product </strong></label> : ${{ recordSelected.price }}</p>
                        <p><label for="exampleInputEmail1"><strong>Description Product </strong></label> : {{ recordSelected.description }}</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-outline-secondary" data-dismiss="modal" ref="closeButton"
                            id="close">Đóng</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>
<script>

export default {
    name: "ViewRecord",

    props: {
        recordSelected: Object
    },

    data() {
        return {

        }
    },

    methods: {

    }

}
</script>

<style scoped>
.modal-header .close {
    outline: none;
}

.modal-dialog {
    max-width: 800px;
}

.cover-course {
    width: 100%;
    height: 40vh;
}
.inner-cover-course {
    border: 1px solid silver;
    padding: 10px;
    width: 100%;
    height: 100%;
}

.cover-course img {
    object-fit: cover;
    height: 100%;
    margin: auto;
}

.course-video {
    margin-top: 60px;
}


@media screen and (min-width: 1201px) {}

@media screen and (min-width: 993px) and (max-width: 1200px) {
    .modal-dialog {
        max-width: 400px;
        margin: 10px auto;
        font-size: 13px;;
    }

    .modal-header{
        padding: auto;
    }

    .modal-header .close {
        font-size: 20px;
    }

    .btn{
        font-size: 13px;
    }
}

@media screen and (min-width: 769px) and (max-width: 992px) {
    .modal-dialog {
        max-width: 350px;
        margin: 10px auto;
        font-size: 11px;;
    }

    .modal-header{
        padding: auto;
    }

    .modal-header .close {
        font-size: 18px;
    }

    .btn{
        font-size: 12px;
    }

    .modal-body{
        padding: 14px 14px 0 14px;
    }
}

@media screen and (min-width: 577px) and (max-width: 768px) {
    .modal-dialog {
        max-width: 320px;
        margin: 10px auto;
        font-size: 9px;;
    }

    .modal-header{
        padding: auto;
    }

    .modal-header .close {
        font-size: 11px;
    }

    .btn{
        font-size: 10px;
    }

    .modal-body{
        padding: 14px 14px 0 14px;
    }
    .alert{
        padding: 8px;
    }
}

@media screen and (min-width: 425px) and (max-width: 575px) {
    .modal-dialog {
        max-width: 275px;
        margin: 10px auto;
        font-size: 9px;;
    }

    .modal-header, .modal-footer{
        padding: 5px 5px;
    }

    .modal-header .close {
        font-size: 11px;
    }

    .btn{
        font-size: 8px;
    }

    .modal-body{
        padding: 12px 12px 0 12px;
    }

    .alert{
        padding: 8px;
    }
}

@media screen and (min-width: 375px) and (max-width: 424px) {
    .modal-dialog {
        max-width: 180px;
        margin: 10px auto;
        font-size: 7px;;
    }

    .modal-header, .modal-footer{
        padding: 5px 5px;
    }

    .modal-header .close {
        font-size: 9px;
    }

    .btn{
        font-size: 7px;
    }

    .modal-body{
        padding: 11px 11px 0 11px;
    }
    
    .alert{
        padding: 6px 10px;
    }
}
</style>