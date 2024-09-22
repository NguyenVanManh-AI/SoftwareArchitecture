<template>
    <div>
        <div id="big">
            <div class="bigContainer">
                <div class="modal fade" id="updateRecord" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                    aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel"><strong>
                                    <i class="fa-solid fa-pen-to-square"></i> Update Product</strong></h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true" class="text-danger"><i
                                            class="fa-regular fa-circle-xmark"></i></span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <form @submit.prevent="updateRecord()">
                                    <div class="form-group">
                                        <label>Name Product</label>
                                        <input v-model="record.name" type="text" class="form-control form-control-sm" id="exampleInputEmail1"
                                            aria-describedby="emailHelp" placeholder="Name Product">
                                        <span v-if="errors.name" class="text-danger">{{ errors.name[0] }}<br></span>
                                    </div>

                                    <div class="form-group">
                                        <label>Price Product</label>
                                        <input v-model="record.price" type="number" class="form-control form-control-sm" id="exampleInputEmail1"
                                            aria-describedby="emailHelp" placeholder="Price Product">
                                        <span v-if="errors.price" class="text-danger">{{ errors.price[0] }}<br></span>
                                    </div>

                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Description Product</label>
                                        <textarea v-model="record.description" rows="3" type="text" class="form-control form-control-sm" id="exampleInputEmail1"
                                            aria-describedby="emailHelp"
                                            placeholder="Description Produc"></textarea>
                                        <span v-if="errors.description" class="text-danger">{{ errors.description[0] }}<br></span>
                                    </div>

                                    <button type="submit" class="mt-4 btn-pers" id="login_button"><i class="fa-solid fa-paper-plane"></i> Cập nhật</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import AdminRequest from '@/restful/AdminRequest';
import useEventBus from '@/composables/useEventBus'
const { emitEvent, onEvent } = useEventBus();

export default {
    name: "UpdateRecord",
    props: {

    },
    setup() {

    },
    data() {
        return {
            record: {
                id: null,
                name: null,
                description: null,
                price: null,
            },
            errors: {
                id: null,
                name: null,
                description: null,
                price: null,
            }
        }
    },
    mounted() {
        onEvent('eventSelectedRecord', (recordSelected) => {
            this.record = { ...recordSelected };
        });
    },
    created() {
    },
    components: {

    },
    computed: {

    },
    methods: {
        updateRecord: async function () {
            try {
                const { data, messages } = await AdminRequest.post('product/update/'+this.record.id, this.record, true);
                emitEvent('eventSuccess', messages[0]);
                for (let key in this.errors) this.errors[key] = null;
                var closePW = window.document.getElementById('updateRecord');
                closePW.click();
                this.record = data;
                emitEvent('eventRegetDataRecords', '');
            }
            catch (error) {
                if (error.errors) this.errors = error.errors;
                else for (let key in this.errors) this.errors[key] = null;
                if (error.messages) emitEvent('eventError', error.messages[0]);
            }

        },
    },
    watch: {

    },
}
</script>

<style scoped>

/*  */
.modal-dialog {
    max-width: 800px;
}

/*  */


.modal.fade.show {
    padding-left: 0px;
}

.modal-content {
    /* margin-top: 100px; */
    border-radius: 10px;
}

.bigContainer .input-form {
    height: 40px;
    width: 100%;
    position: relative;
}

.bigContainer .input-form input {
    height: 100%;
    width: 100%;
    border: none;
    font-size: 17px;
    border-bottom: 2px solid silver;
    outline: none !important;
}

.input-form input:focus~label,
.input-form input:valid~label {
    transform: translateY(-20px);
    font-size: 15px;
    color: var(--user-color);
}

.input-form .underline.fix2:before {
    position: absolute;
    content: "";
    height: 100%;
    width: 100%;
    background: var(--user-color);
    transform: scaleX(0);
    transform-origin: center;
    transition: transform 0.3s ease;
}

.bigContainer .input-form label {
    position: absolute;
    bottom: 0px;
    left: 0;
    color: grey;
    pointer-events: none;
    transition: all 0.3s ease;
}

.input-form .underline {
    position: absolute;
    height: 2px;
    width: 100%;
    bottom: 0;
}

.input-form .underline:before {
    position: absolute;
    content: "";
    height: 100%;
    width: 100%;
    background: var(--user-color);
    transform: scaleX(0);
    transform-origin: center;
    transition: transform 0.3s ease;
}

.input-form input:focus~.underline:before,
.input-form input:valid~.underline:before {
    transform: scaleX(1);
}

@import url('https://fonts.googleapis.com/css2?family=Reem+Kufi+Ink');

#big {
    display: flex;
    position: relative;
}

.btn-pers {
    position: relative;
    left: 50%;
    padding: 1em 2.5em;
    font-size: 12px;
    text-transform: uppercase;
    letter-spacing: 2.5px;
    font-weight: 700;
    color: #000;
    background-color: #fff;
    border: none;
    border-radius: 45px;
    box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
    transition: all 0.3s ease 0s;
    cursor: pointer;
    outline: none;
    transform: translateX(-50%);
}

.btn-pers:hover {
    background-color: var(--user-color);
    box-shadow: var(--btn-hover);
    color: #fff;
    transform: translate(-50%, -7px);
}

.btn-pers:active {
    transform: translate(-50%, -1px);
}

#inputPassword {
    padding-right: 26px;
}
</style>
