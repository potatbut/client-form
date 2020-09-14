<template>
  <div id="app">

    <form>
      <div class="form-group">
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
            <template v-if="!$v.birthdayDate.required">
            Поле обязательно для заполнения
            </template>
          </div>
        </div>
        <div class="gender">
          <label for="gender">Пол</label>
          <input type="radio" name="gender" class="gender-male"> Мужской
          <input type="radio" name="gender" class="gender-female"> Женский
        </div>
      </div>

    </form>

  </div>
</template>

<script>

import { alpha, required, numeric } from 'vuelidate/lib/validators'
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
    }
  },
  validations: {
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
    }
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