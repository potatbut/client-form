<template>
  <div id="app">

    <form>
      <div class="personData">
        <label for="personData"> Персональные данные</label>
        <!-- First Name -->
       <div class="firstName">
          <label for="name">Имя</label>
          <input 
            id="firstName" 
            type="text" 
            class="form-control" 
            placeholder="Имя" 
            v-model.trim="firstName" 
            @blur="$v.firstName.$touch()"
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
        <div class="lastName">
          <label for="lastName">Фамилия</label>
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
        <div class="patronymic">
          <label for="lastName">Отчество</label>
          <input 
            id="patronymic" 
            type="text" 
            class="form-control" 
            placeholder="Отчество" 
            v-model.trim="patronymic"
          >
          <div class="error" v-if="!$v.patronymic.alpha">Отчество должно содержать только буквы.</div>
        </div>

        <!-- Birthday Date -->
        <div class="birthdayDate">
          <label for="birthdayDate">Дата рождения</label>
          <input 
            id="birthdayDate" 
            type="text" 
            v-model="birthdayDate"
            placeholder="дд.мм.гггг"
            @blur="$v.birthdayDate.$touch()"
          >
          <!-- Errors for birthday Date -->
          <div class="error" v-if="$v.birthdayDate.$error">
            <template v-if="!$v.birthdayDate.validDate">
            Дата рождения должна быть в формате дд.мм.гггг
            </template>
            <template v-else>
            Поле обязательно для заполнения
            </template>
          </div>

        </div>
        <!-- Phone number-->
        <div class='phone'>
          <label for="phone">Номер телефона</label>
          <span>+7</span>
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
        <div class="clientGroup">
          <label for="clientGroup">Група клиентов</label>
          <select v-model="selected" id="clientGroup">
            <option value="">VIP</option>
            <option value="">Проблемные</option>
            <option value="">ОМС</option>
          </select>
        </div>
        <!-- Attending Doctor -->
        <div class="attendingDoctor">
          <label for="attendingDoctor">Лечащий врач</label>
          <select v-model="selected" id="attendingDoctor">
            <option value="">Иванов</option>
            <option value="">Захаров</option>
            <option value="">Чернышева</option>
          </select>
        </div>
        <!-- Sms checkbox -->
        <div class="sms">
          <label for="sms">Не отравлять смс</label>
          <input type="checkbox" id="sms">
        </div>
      </div>
      <div class="address">
        <label for="address">Адрес:</label>
        <div class="ZIPcode">
          <label for="ZIPcode">Индекс</label>
          <input 
            id="ZIPcode" 
            type="text" 
            v-model="ZIPcode"
            placeholder="555-555"
          >
        </div>
        <div class="country">
          <label for="country">Страна</label>
          <input type="text">
        </div>
        <div class="region">
          <label for="region">Область</label>
          <input type="text">
        </div>
        <div class="city">
          <label for="ciry">Город</label>
          <input 
            type="text"
            @blur="$v.city.$touch()"
          >
          <div class="error" v-if="$v.city.$error">
            <template v-if="!$v.city.required">
            Поле обязательно для заполнения
            </template>
          </div>
        </div>
        <div class="street">
          <label for="street">Улица</label>
          <input type="text">
        </div>
        <div class="houseNumber">
          <label for="houseNumber">Дом</label>
          <input type="text">
        </div>
      </div>
      <div class="identityDocument">
        <label for="identityDocument">Документ удостоверяющий личность:</label>
        <div class="documentType">
          <label for="documentType">Тип документа</label>
          <select v-model="selected" id="documentTyoe">
            <option value="">Паспорт</option>
            <option value="">Свидетельство о рождении</option>
            <option value="">Вод. удостоверение</option>
          </select>
        </div>
        <div class="serialNumber">
          <label for="serialNumber">Серия</label>
          <input type="text">
        </div>
        <div class="documentNumber">
        <label for="documentNumber">Номер</label>
        <input type="text">
        </div>
        <div class="issued">
          <label for="issued">Кем выдан</label>
          <input 
            type="text" 
            id="issued"
            @blur="$v.issued.$touch()"
            >
        </div>
        <div class="error" v-if="$v.issued.$error">
            <template v-if="!$v.issued.required">
            Поле обязательно для заполнения
            </template>
          </div>

      </div>
    </form>

  </div>
</template>

<script>

import { alpha, required, numeric, selected } from 'vuelidate/lib/validators'
import moment from "moment";

export default {
  name: 'App',
  data() {
    return {
      firstName: '',
      lastName: '',
      patronymic: '',
      birthdayDate:'',
      phone:'',
      clientGroup:'',
      attendingDoctor: '',
      ZIPcode: '',
      city: '',
      issued: '',
    }
  },
  validations: {
    issued: {
      required
    },
    attendingDoctor: {
      selected
    },
    clientGroup: {
      selected
    },
    city: {
      required,
    },
    firstName: {
      alpha: val => /^[а-яё]*$/i.test(val),
      required
    },
    lastName: {
      alpha: val => /^[а-яё]*$/i.test(val),
      required
    },
    patronymic: {
      alpha: val => /^[а-яё]*$/i.test(val),
      required
    },
    birthdayDate: {
      required,
      validDate: val => moment(val, "DD.MM.YYYY", true).isValid(),
    },
    phone: {
      required
    },
  }
}
</script>

<style lang="sass">
  #app 
    font-family: Avenir, Helvetica, Arial, sans-serif
    -webkit-font-smoothing: antialiased
    -moz-osx-font-smoothing: grayscale
    text-align: center
    color: #2c3e50
    margin-top: 60px
  .error
    color: red
</style>