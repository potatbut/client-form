<template>
  <div id="app">
    
    <form @submit.prevent="onSubmit" class="form">
      <h1>Создание клиента</h1>
      <div class="personData">
      <!-- First Name -->
      <label for="personData" class="form__block"> Персональные данные</label>
       <div class="form-group">
          <label for="name">Имя*</label>
          <input 
            id="firstName" 
            type="text" 
            class="form-control" 
            placeholder="Имя" 
            v-model="firstName" 
            @blur="$v.firstName.$touch()"
            :class="{invalid: $v.firstName.required}"
          >
          <!-- Errors for first name -->
          <div class="error" v-if="$v.firstName.$error">
            <template v-if="!$v.firstName.alpha">
            Имя должно содержать только буквы
            </template>
            <template v-else>
            Поле обязательно для заполнения
            </template>
          </div>
        </div>

        <!-- Last Name --> 
        <div class="form-group">
          <label for="lastName">Фамилия*</label>
          <input 
            id="lastName" 
            type="text" 
            class="form-control" 
            placeholder="Фамилия" 
            v-model.trim="lastName"
            @blur="$v.lastName.$touch()"
          >
          <!-- Errors for first name -->
          <div class="error" v-if="$v.lastName.$error">
            <template v-if="!$v.lastName.alpha">
            Фамилия должна содержать только буквы
            </template>
            <template v-else>
            Поле обязательно для заполнения
            </template>
          </div>
        </div>

        <!-- Patronymic -->
        <div class="form-group">
          <label for="lastName">Отчество</label>
          <input 
            id="patronymic" 
            type="text" 
            class="form-control" 
            placeholder="Отчество" 
            v-model="patronymic"
          >
          <div class="error" v-if="!$v.patronymic.alpha">Отчество должно содержать только буквы.</div>
        </div>

        <!-- Birthday Date -->
        <div class="form-group">
          <label for="birthdayDate">Дата рождения*</label>
          <input 
            id="birthdayDate" 
            type="text" 
            v-model="birthdayDate"
            placeholder="дд.мм.гггг"
            @blur="$v.birthdayDate.$touch()"
            name="birthdayDate"
            maxlength="10"
            v-Date
            class="form-control"
            pattern="[0-9]{2}.[0-9]{2}.[0-9]{4}"
          >
          <!-- Errors for birthday Date -->
          <div class="error" v-if="$v.birthdayDate.$error">
            <template v-if="!$v.birthdayDate.required">
            Поле обязательно для заполнения
            </template>
          </div>

        </div>
        <!-- Phone number-->
        <div class='form-group'>
          <label for="phone">Номер телефона*</label>
          <div class='phone'>
            <span class="seven">+7</span>
            <input 
              type="tel"
              v-model="phone"
              name="phone"
              id="phone"
              placeholder="(555) 555-5555"
              autocomplete="tel"
              maxlength="14"
              v-phone
              class="form-control"
              pattern="[(][0-9]{3}[)] [0-9]{3}-[0-9]{4}"
              @blur="$v.phone.$touch()"
              > 
              </div>
            <!-- Errors for Phone number-->
            <div class="error" v-if="$v.phone.$error">
            <template v-if="!$v.phone.required">
            Поле обязательно для заполнения
            </template>
            </div>
        </div>
        <div class="gender">
          <label for="gender">Пол</label>
          <input type="radio" name="gender" class="gender-male"> Мужской
          <input type="radio" name="gender" class="gender-female"> Женский
        </div>
        <!-- Client group selector -->
        <div class="form-group">
          <label for="clientGroup">Группа клиентов*</label>
          <select v-model="selectedGroup" id="clientGroup" @blur="$v.selectedGroup.$touch()">
            <option disabled value="">Выберите один из вариантов</option>
            <option>VIP</option>
            <option>Проблемные</option>
            <option>ОМС</option>
          </select>
          <div class="error" v-if="$v.selectedGroup.$error">
            <template v-if="!$v.selectedGroup.required">
            Поле обязательно для заполнения
            </template>
          </div>
        </div>
        <!-- Attending Doctor -->
        <div class="form-group">
          <label for="attendingDoctor">Лечащий врач</label>
          <select v-model="selectedDoctor" id="attendingDoctor">
            <option disabled value="">Выберите один из вариантов</option>
            <option>Иванов</option>
            <option>Захаров</option>
            <option>Чернышева</option>
          </select>
        </div>
        <!-- Sms checkbox -->
        <div class="sms">
          <label for="sms">Не отравлять смс</label>
          <input type="checkbox" id="sms">
        </div>
      </div>
      <div class="address">
        <label for="address" class="form__block">Адрес:</label>
        <div class="form-group"> 
          
          <div class="ZIPcode">
            <label for="ZIPcode">Индекс</label>
            <input 
              id="ZIPcode" 
              type="text"
              v-model="ZIPcode"
              placeholder="123456"
              maxlength="6"
            >
          </div>
        </div>
        <div class="form-group">
          <label for="country">Страна</label>
          <input type="text">
        </div>
        <div class="form-group">
          <label for="region">Область</label>
          <input type="text">
        </div>
        <div class="form-group">
          <label for="city">Город*</label>
          <input 
            id="city"
            type="text"
            class="form-control"
            placeholder="Город"
            v-model="city"
            @blur="$v.city.$touch()"
          >
          <div class="error" v-if="$v.city.$error">
            <template v-if="!$v.city.alpha">
            Поле должго содержать только буквы
            </template>
            <template v-else>
            Поле обязательно для заполнения
            </template>
          </div>
        </div>
        <div class="form-group">
          <label for="street">Улица</label>
          <input type="text">
        </div>
        <div class="form-group">
          <label for="houseNumber">Дом</label>
          <input type="text">
        </div>
      </div>
      <div class="identityDocument">
        <label for="identityDocument" class="form__block">Документ, удостоверяющий личность:</label>
        <div class="form-group">
          <label for="documentType">Тип документа*</label>
          <select v-model="selectedDoc" id="documentType" @blur="$v.selectedDoc.$touch()">
            <option disabled value="">Выберите один из вариантов</option>
            <option>Паспорт</option>
            <option>Свидетельство о рождении</option>
            <option>Вод. удостоверение</option>
          </select>
          <div class="error" v-if="$v.selectedDoc.$error">
            <template v-if="!$v.selectedDoc.required">
            Поле обязательно для заполнения
            </template>
          </div>
        </div>
        <div class="form-group">
          <label for="serialNumber">Серия</label>
          <input type="text">
        </div>
        <div class="form-group">
        <label for="documentNumber">Номер</label>
        <input type="text">
        </div>
        <div class="form-group">
          <label for="issued">Кем выдан</label>
          <input 
            type="text" 
            id="issued"
            v-model="issued"
            @blur="$v.issued.$touch()"
            >
        </div>
        <div class="error" v-if="$v.issued.$error">
            <template v-if="!$v.issued.required">
            Поле обязательно для заполнения
            </template>
          </div>

        <div class="form-group">
          <label for="issuedDate">Дата выдачи документа*</label>
          <input 
            id="issuedDate" 
            type="text"
            placeholder="дд.мм.гггг"
            v-model="issuedDate"
            name="issuedDate"
            maxlength="10"
            v-Date
            class="form-control"
            pattern="[0-9]{2}.[0-9]{2}.[0-9]{4}"
            @blur="$v.issuedDate.$touch()"
          >
          <div class="error" v-if="$v.issuedDate.$error">
            <template v-if="!$v.issuedDate.required">
            Поле обязательно для заполнения
            </template>
          </div>
        </div>
      </div>

      <button type="submit">Отправить</button>

    </form>
    
  </div>
</template>

<script>


import { alpha, required, numeric } from 'vuelidate/lib/validators'

export default {
  name: 'App',
  data() {
    return {
      firstName: '',
      lastName: '',
      patronymic: '',
      birthdayDate:'',
      phone:'',
      selectedGroup: '',
      selectedDoctor:'',
      ZIPcode: '',
      city: '',
      selectedDoc: '',
      issued: '',
      issuedDate: '',
      zalupa: '',
    }
  },
  validations: {
    firstName: { alpha: val => /^[а-яё]*$/i.test(val), required },
    lastName: { alpha: val => /^[а-яё]*$/i.test(val), required },
    patronymic: { alpha: val => /^[а-яё]*$/i.test(val) },
    birthdayDate: { required },
    phone: { required },
    selectedGroup: { required },
    ZIPcode: { numeric },
    city: { alpha: val => /^[а-яё]*$/i.test(val), required },
    selectedDoc: { required },
    issued: { required},
    issuedDate: { required },
  },
  methods: {
    onSubmit(e)  {
      this.$v.$touch()
      if (this.$v.$anyError) {
        return
      }
      alert('Клиент создан')
    } 
   }
}
</script>

<style lang="sass">
  *
    background: #f2f2f2
  #app 
    font-family: Lucida Sans Unicode, sans-serif
    color: #2c3e50
  .error
    color: red
    font-size: 0.7rem
  .form
    width: 60%
    margin: auto
    justify-content: space-around
    flex-wrap: wrap
    &__block
      font-size: 1.4rem
      font-weight: bolder
    &-group
      .phone
        display: flex
        .seven 
          margin: auto 5px auto auto
      label 
        display: flex
        font-size: 1.1rem
        margin: 10px
      input, select
        background: white
        width: 100%
        padding: 12px 20px
        margin: 8px 0
        display: inline-block
        border: 1px solid #ccc
        border-radius: 4px
        box-sizing: border-box
    button
      width: 100%
      background-color: #4CAF50
      color: white
      padding: 14px 20px
      margin: 8px 0
      border: none
      border-radius: 4px
      cursor: pointer
    .sms
      display: flex
      input
        margin: auto auto auto 20px

</style>