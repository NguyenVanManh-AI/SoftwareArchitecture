<template>
    <div id="main">
        <div>
            <h3 class="titleChannel"> <i class="fa-brands fa-dropbox"></i> Manage Product</h3>
        </div>
        <div class="ml-2 mt-2">
            <div class="mt-3">
                <div class="row m-0 pb-2 d-flex justify-content-end" id="search-sort">
                    <div class="col-1 pl-0" id="page">
                        <select content="Phân trang" v-tippy class="form-control" v-model="big_search.per_page">
                            <option value="5">5</option>
                            <option value="10">10</option>
                            <option value="15">15</option>
                            <option value="20">20</option>
                        </select>
                    </div>
                    <div class="col-2 pl-0">
                        <select content="Sắp xếp theo" v-tippy class="form-control " v-model="big_search.order_by">
                            <option value="id">ID</option>
                            <option value="name">Name</option>
                            <option value="description">Description</option>
                        </select>
                    </div>
                    <div class="col-2 pl-0">
                        <select content="Kiểu sắp xếp" v-tippy class="form-control " v-model="big_search.order_direction">
                            <option value="ASC">Gradually increase</option>
                            <option value="DESC">Gradually decreasing</option>
                        </select>
                    </div>
                    <div class="col-3 pl-0">
                        <div content="Tìm kiếm theo tên khóa học" v-tippy class="input-group">
                            <div class="input-group-prepend">
                                <div class="input-group-text"><i class="fa-solid fa-magnifying-glass"></i></div>
                            </div>
                            <input v-model="search.search" type="text" class="form-control " id="inline-form-input-group"
                                placeholder="Enter something...">
                        </div>
                    </div>
                    <button type="button" data-toggle="modal" data-target="#addRecord" class="btn btn-outline-success btn-sm"><i class="fa-solid fa-plus"></i> Create Product</button>
                </div>
                <div v-if="isLoading">
                    <TableLoading :cols="8" :rows="9"></TableLoading>
                </div>
                <div v-if="!isLoading" class="tableData">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col"><i class="fa-solid fa-signature"></i> Name Product</th>
                                <th scope="col"><i class="fa-solid fa-signature"></i> Price Product</th>
                                <th scope="col"><i class="fa-solid fa-signature"></i> Description Product</th>
                                <th scope="col">Created</th>
                                <th scope="col">Updated</th>
                                <th scope="col"><i class="fa-solid fa-user-pen"></i> Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr v-for="(record, index) in records" :key="index">
                                <th class="table-cell" scope="row">#{{ (big_search.page - 1) * big_search.per_page + index +
                                    1 }}</th>
                                <td class="table-cell displaytext break">{{ truncatedTitle(record.name) }}</td>
                                <td class="table-cell"> $ {{ truncatedTitle(record.price)}}</td>
                                <td class="table-cell">{{ truncatedTitle(record.description) }}</td>
                                <td class="table-cell text-center">{{ formatDate(record.created_at) }}</td>
                                <td class="table-cell text-center">{{ formatDate(record.updated_at) }}</td>
                                <td class="table-cell text-center">
                                    <div class="action">
                                        <div>
                                            <button data-toggle="modal" data-target="#updateRecord"
                                        v-tippy="{ content: 'Update' }" class="updateRecord"
                                            @click="selectedRecord(record)">
                                            <i class="fa-solid fa-pen-to-square"></i>
                                        </button>
                                        <button data-toggle="modal" data-target="#deleteRecord"
                                            v-tippy="{ content: 'Delete'}"
                                            class="deleteRecord" @click="selectedRecord(record)">
                                            <i class="fa-solid fa-trash"></i>
                                        </button>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div id="divpaginate" class="mt-2">
                    <paginate v-if="paginateVisible" :page-count="last_page" :page-range="3" :margin-pages="2"
                        :click-handler="clickCallback" :initial-page="big_search.page" :prev-text="'Prev'"
                        :next-text="'Next'" :container-class="'pagination'" :page-class="'page-item'">
                    </paginate>
                </div>
                <DeleteRecord :course_id="course_id" :recordSelected="recordSelected"></DeleteRecord>
                <!-- <LockRecord :recordSelected="recordSelected"></LockRecord>
                <ViewRecord :recordSelected="recordSelected"></ViewRecord> -->
                <AddRecord :course_id="course_id"></AddRecord>
                <UpdateRecord :recordSelected="recordSelected" :course_id="course_id"></UpdateRecord>
            </div>
        </div>
    </div>
</template>
<script>

import AdminRequest from '@/restful/AdminRequest';
import Paginate from 'vuejs-paginate-next';
import config from '@/config';
import TableLoading from '@/components/common/TableLoading'
import _ from 'lodash';
import DeleteRecord from '@/components/admin/admin-dashboard/manage-product/DeleteRecord.vue'
// import LockRecord from '@/components/admin/admin-dashboard/manage-product/LockRecord.vue'
// import ViewRecord from '@/components/admin/admin-dashboard/manage-product/ViewRecord.vue'
import AddRecord from '@/components/admin/admin-dashboard/manage-product/AddRecord.vue'
import UpdateRecord from '@/components/admin/admin-dashboard/manage-product/UpdateRecord.vue'
// import UpdateInformationChannel from '@/components/user/member-account/UpdateInformationChannel.vue'
import useEventBus from '@/composables/useEventBus'
const { emitEvent, onEvent } = useEventBus();

export default {
    name: "ManageProduct",
    components: {
        paginate: Paginate,
        TableLoading,
        DeleteRecord,
        // LockRecord,
        // ViewRecord,
        AddRecord,
        UpdateRecord,
        // UpdateInformationChannel
    },
    setup() {
        document.title = "Quản lí Chapter | Academy Pro"
    },
    data() {
        return {
            config: config,
            total: 0,
            last_page: 1,
            paginateVisible: true,
            search: {
                search:'',
            },
            big_search: {
                per_page: 5,
                page: 1,
                order_by: 'id',
                order_direction: 'ASC',
            },
            query: '',
            records: [],
            recordSelected: {
                id: null,
                name: null,
                course_id: null,
                position: null,
                created_at: null,
                updated_at: null,
            },
            isLoading: false,
            isDeleteChangeMany: 0,
        }
    },
    mounted() {
        emitEvent('eventTitleHeader', 'Manage Product');
        emitEvent('eventActiveTab', '');

        const queryString = window.location.search;
        const searchParams = new URLSearchParams(queryString);
        this.search.name = searchParams.get('name') || '';
        this.big_search = {
            per_page: parseInt(searchParams.get('per_page')) || 5,
            page: searchParams.get('page') || 1,
            order_by: searchParams.get('order_by') || 'id',
            order_direction: searchParams.get('order_direction') || 'ASC',
        }
        this.getDataRecords();
        onEvent('eventRegetDataRecords', () => {
            this.getDataRecords();
        });
        onEvent('eventUpdateIsDeleteRecord', (id_record) => {
            this.records.forEach(record => {
                if (record.id == id_record) {
                    if (record.is_delete == 0) record.is_delete = 1;
                    else record.is_delete = 0;
                }
            });
        });
        onEvent('eventUpdateIsBlockRecord', (id_record) => {
            this.records.forEach(record => {
                if (record.id == id_record) {
                    if (record.is_block == 0) record.is_block = 1;
                    else record.is_block = 0;
                }
            });
        });
    },

    methods: {
        reRenderPaginate: function () {
            if (this.big_search.page > this.last_page) this.big_search.page = this.last_page;
            this.paginateVisible = false;
            this.$nextTick(() => { this.paginateVisible = true; });
        },
        getDataRecords: async function () {
            this.isLoading = true;
            this.query = `?order_by=${this.big_search.order_by}&search=${this.search.search}&order_direction=${this.big_search.order_direction}&page=${this.big_search.page}&per_page=${this.big_search.per_page}`;
            // window.history.pushState({}, null, this.query);
            window.history.replaceState({}, null, this.query);
            try {
                const { data } = await AdminRequest.get('product/all' + this.query)
                this.records = data.data;
                this.total = data.total;
                this.last_page = data.last_page;
                this.isLoading = false;
            }
            catch (error) {
                if (error.messages) emitEvent('eventError', error.messages[0]);
                this.isLoading = false;
            }
            this.reRenderPaginate();
        },
        truncatedTitle(title) {
            const maxLength = 150;
            if (title.length > maxLength) return title.slice(0, maxLength) + '...';
            else return title;
        },
        formatDate: function (date) {
            const formattedDate = new Date(date);

            const day = formattedDate.getDate();
            const month = formattedDate.getMonth() + 1;
            const year = formattedDate.getFullYear();

            const formattedDateString = `${day}/${month}/${year}`;

            return formattedDateString;
        },
        clickCallback: function (pageNum) {
            this.big_search.page = pageNum;
        },

        selectedRecord: async function (record) {
            emitEvent('eventSelectedRecord', record);
            this.recordSelected = record;
        },

    },
    watch: {
        big_search: {
            handler: function () {
                this.getDataRecords();
            },
            deep: true
        },
        search: {
            handler: _.debounce(function () {
                this.getDataRecords();
            }, 500),
            deep: true,
        },
    }
}
</script>

<style scoped>
.div_microphone {
    cursor: pointer;
}

.titleChannel {
    font-size: 19px;
    color: var(--user-color);
}

tr th {
    color: var(--user-color);
}

.colorTitle {
    color: gray;
}

.tableData {
    min-height: 20vh;
    overflow-y: scroll;
}

.coverCourse {
    display: flex;
    align-items: center;
    align-content: center;
}

.deleteRecord .fa-trash:hover {
    transition: all 0.5s ease;
    color: red;
}

.deleteRecord .fa-trash-arrow-up:hover {
    transition: all 0.5s ease;
    color: green;
}

.deleteRecord {
    transition: all 0.5s ease;
    font-size: 20px;
}

.viewRecord, .updateRecord {
    transition: all 0.5s ease;
    font-size: 20px;
}

.viewRecord i:hover {
    transition: all 0.5s ease;
    font-size: 20px;
    color: #007BFF;
}

.updateRecord i:hover {
    transition: all 0.5s ease;
    font-size: 20px;
    color: #007BFF;
}

.lockRecord {
    transition: all 0.5s ease;
    font-size: 20px;
}

.lockRecord .fa-lock:hover {
    transition: all 0.5s ease;
    color: red;
}

.lockRecord .fa-lock-open:hover {
    transition: all 0.5s ease;
    color: green;
}

.coverCourse img {
    border-radius: 6px;
}

.nameMember {
    margin-left: 10px;
}

#main {
    padding: 10px 20px;
    min-width: 375px !important;
}

#page {
    margin-right: auto;
    min-width: 78px;
}

table {
    font-size: 12px;
}

table img {
    width: 200px; 
    /* height:200px; */
    object-fit: cover;
}

.table-cell {
    font-weight: bold;
    vertical-align: middle;
}

table button {
    padding: 1px 3px;
    margin-right: 2px;
}

table thead th {
    vertical-align: middle;
    text-align: center;
}

.action {
    display: flex;
    align-items: center;
    justify-content: center;
}

.form-control{
    height: calc(1.5em + .5rem + 2px);
    padding: .25rem .5rem;
    font-size: .875rem;
    border-radius: 0.2rem;
    line-height: 1.5;
}

@media screen and (min-width: 1201px) {
    table {
        max-width: 100%;
        vertical-align: middle;
    }

    .coverCourse {
        min-width: 150px;
    }

    .displaytext {
        min-width: 150px;
        overflow: hidden;
        -webkit-line-clamp: 3 !important;
        -webkit-box-orient: vertical;
    }

    table img {
        min-width: 60px;
        min-height: 60px;
        /* max-width: 60px; */
        /* max-height: 60px; */
        object-fit: cover;
    }

    td .fa-solid {
        font-size: 20px;
    }

}

@media screen and (min-width: 993px) and (max-width: 1200px) {
    table {
        max-width: 100%;
        vertical-align: middle;
    }

    .coverCourse {
        min-width: 120px;
    }

    .displaytext {
        min-width: 100px;
        overflow: hidden;
        -webkit-line-clamp: 3 !important;
        -webkit-box-orient: vertical;

    }

    .break {
        word-break: break-all;
    }

    table {
        font-size: 11px;
    }

    .fa-solid {
        font-size: 15px;
    }

    table img {
        min-width: 50px;
        min-height: 50px;
        /* max-width: 50px;
        max-height: 50px; */
        object-fit: cover;
    }

    .table td,
    .table th {
        padding: 8px;
    }

    .form-control,
    .pagination {
        font-size: 12px !important;
    }

    #main {
        padding: 1% 1%;
        margin: 0;
    }
}

@media screen and (min-width: 769px) and (max-width: 992px) {
    .titleChannel {
        font-size: 15px;
    }

    .colorTitle {
        font-size: 14px;
    }

    table {
        max-width: 100%;
        vertical-align: middle;
    }

    .coverCourse {
        min-width: 140px;
    }

    .displaytext {
        min-width: 110px;
        overflow: hidden;
        -webkit-line-clamp: 3 !important;
        -webkit-box-orient: vertical;

    }

    .break {
        word-break: break-all;
    }

    table {
        font-size: 11px;
    }

    .fa-solid {
        font-size: 16px;
    }

    table img {
        min-width: 50px;
        min-height: 50px;
        max-width: 50px;
        max-height: 50px;
        object-fit: cover;
    }

    .table td,
    .table th {
        padding: 8px;
    }

    .form-control,
    .pagination {
        font-size: 12px !important;
    }

    #main {
        padding: 1% 1%;
        margin: 0;
    }

    .col-1,
    .col-2,
    .col-3 {
        padding-left: 0;
        padding-right: 10px;
    }

    .btn {
        padding: 0px 4px;
        margin-top: 3px;
    }

    .input-group-text {
        padding: 0 8px;
    }
}

@media screen and (min-width: 577px) and (max-width: 768px) {

    .titleChannel,
    .colorTitle {
        font-size: 13px;
    }

    table {
        max-width: 100%;
        vertical-align: middle;
    }

    .coverCourse {
        min-width: 100px;
    }

    .displaytext {
        min-width: 90px;
        overflow: hidden;
        -webkit-line-clamp: 3 !important;
        -webkit-box-orient: vertical;

    }

    .break {
        word-break: break-all;
    }

    table {
        font-size: 11px;
    }

    .fa-solid {
        font-size: 13px;
    }

    table img {
        min-width: 40px;
        min-height: 40px;
        max-width: 40px;
        max-height: 40px;
        object-fit: cover;
    }

    .table td,
    .table th {
        padding: 5px;
    }

    .form-control,
    .pagination {
        font-size: 12px !important;
    }

    #page {
        min-width: 45px;
    }
    
    .form-control {
        padding: 1px 1px;
    }

    #main {
        padding: 1% 1%;
        margin: 0;
    }

    .col-1,
    .col-2,
    .col-3 {
        padding-right: 5px;
    }

    .btn {
        padding: 0px 4px;
        margin-top: 3px;
    }

    .input-group-text {
        padding: 0 4px;
    }

    .input-group-prepend {
        font-size: 12px;

    }
}

@media screen and (min-width: 425px) and (max-width: 576px) {

    .titleChannel,
    .colorTitle {
        font-size: 12px;
    }

    table {
        max-width: 100%;
        vertical-align: middle;
    }

    .nameMember {
        margin-left: 8px;
    }

    .coverCourse {
        min-width: 100px;
    }

    .displaytext {
        min-width: 70px;
        overflow: hidden;
        -webkit-line-clamp: 3 !important;
        -webkit-box-orient: vertical;

    }

    .break {
        word-break: break-all;
    }

    table {
        font-size: 10px;
    }

    .fa-solid {
        font-size: 10px;
    }

    table img {
        min-width: 40px;
        min-height: 40px;
        max-width: 40px;
        max-height: 40px;
        object-fit: cover;
    }

    .table td,
    .table th {
        padding: 4px;
    }

    .form-control,
    .pagination {
        font-size: 10px !important;
    }

    .form-control {
        padding: 1px 1px;
        height: 25px;
    }

    #page {
        min-width: 45px;
    }

    #main {
        padding: 1% 1%;
        margin: 0;
    }

    .col-1,
    .col-2,
    .col-3 {
        padding-right: 5px;
    }

    .btn {
        padding: 0px 4px;
    }

    .input-group-text {
        padding: 0 0.5px;
    }

    .input-group-prepend {
        font-size: 11px;

    }
}

@media screen and (min-width: 375px) and (max-width: 424px) {
    .titleChannel,
    .colorTitle {
        font-size: 11px;
    }

    table {
        max-width: 100%;
        vertical-align: middle;
    }

    .nameMember {
        margin-left: 8px;
    }

    .coverCourse {
        min-width: 80px;
    }

    .displaytext {
        min-width: 70px;
        overflow: hidden;
        -webkit-line-clamp: 3 !important;
        -webkit-box-orient: vertical;

    }

    .break {
        word-break: break-all;
    }

    table {
        font-size: 9px;
    }

    .fa-solid {
        font-size: 10px;
    }

    table img {
        min-width: 40px;
        min-height: 40px;
        max-width: 40px;
        max-height: 40px;
        object-fit: cover;
    }

    .table td,
    .table th {
        padding: 4px;
    }

    .form-control,
    .pagination {
        font-size: 9px !important;
    }

    .form-control {
        padding: 0.5px 0;
        height: 25px;
    }

    #page {
        min-width: 40px;
    }

    #main {
        padding: 1% 1%;
        margin: 0;
    }

    .col-1,
    .col-2,
    .col-3 {
        padding-right: 0;
    }

    .btn {
        padding: 0px 4px;
    }

    .input-group-text {
        padding: 0 0.5px;
    }

    .input-group-prepend {
        font-size: 10px;

    }

    #main .ml-2{
        margin-left: 3px !important;
    }
}
</style>
