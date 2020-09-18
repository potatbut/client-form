<template>
  <div id="app">

    <form @submit.prevent="onSubmit">
      <div class="personData">
        <h1>Создание клиента</h1>
        <label for="personData"> Персональные данные</label>
        <!-- First Name -->
       <div class="firstName">
          <label for="name">Имя*</label>
          <input 
            id="firstName" 
            type="text" 
            class="form-control" 
            placeholder="Имя" 
            v-model="firstName" 
            @blur="$v.firstName.$touch()"
            :class="{invalid: ($v.firstName.$dirty && !$v.firstName.required)}"
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
        <div class='phone'>
          <label for="phone">Номер телефона*</label>
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
          <label for="clientGroup">Группа клиентов*</label>
          <select v-model="selectedGroup" id="clientGroup" @blur="$v.selectedGroup.$touch()">
            <option disabled value="">Выберите один из вариантов</option>
            <option>VIP</option>
            <option>Проблемные</option>
            <option>ОМС</option>
          </select>
          <span>Выбрано: {{selectedGroup}}</span>
          <div class="error" v-if="$v.selectedGroup.$error">
            <template v-if="!$v.selectedGroup.required">
            Поле обязательно для заполнения
            </template>
          </div>
        </div>
        <!-- Attending Doctor -->
        <div class="attendingDoctor">
          <label for="attendingDoctor">Лечащий врач</label>
          <select v-model="selectedDoctor" id="attendingDoctor">
            <option disabled value="">Выберите один из вариантов</option>
            <option>Иванов</option>
            <option>Захаров</option>
            <option>Чернышева</option>
          </select>
          <span>Выбрано: {{ selectedDoctor }}</span>
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
            placeholder="123456"
            maxlength="6"
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
        <label for="identityDocument">Документ, удостоверяющий личность:</label>
        <div class="documentType">
          <label for="documentType">Тип документа*</label>
          <select v-model="selectedDoc" id="documentType" @blur="$v.selectedDoc.$touch()">
            <option disabled value="">Выберите один из вариантов</option>
            <option>Паспорт</option>
            <option>Свидетельство о рождении</option>
            <option>Вод. удостоверение</option>
          </select>
          <span>Выбрано: {{ selectedDoc }}</span>
          <div class="error" v-if="$v.selectedDoc.$error">
            <template v-if="!$v.selectedDoc.required">
            Поле обязательно для заполнения
            </template>
          </div>
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
            v-model="issued"
            @blur="$v.issued.$touch()"
            >
        </div>
        <div class="error" v-if="$v.issued.$error">
            <template v-if="!$v.issued.required">
            Поле обязательно для заполнения
            </template>
          </div>

        <div class="issuedDate">
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
          <!-- Errors for birthday Date -->
          <div class="error" v-if="$v.issuedDate.$error">
            <template v-if="!$v.issuedDate.required">
            Поле обязательно для заполнения
            </template>
          </div>
        </div>
      </div>

      <button type="submit">Submit</button>

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
      clientGroup:'',
      attendingDoctor: '',
      ZIPcode: '',
      city: '',
      issued: '',
      selectedDoctor:'',
      selectedDoc: '',
      selectedGroup: '',
      issueDate: '',
      issuedDate: '',
      submit: '',
    }
  },
  validations: {
    issued: {
      required
    },
    city: {
      alpha: val => /^[а-яё]*$/i.test(val),
      required
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
      required
    },
    phone: {
      required
    },
    issueDate: {
      required
    },
    clientGroup: {
      required
    },
    attendingDoctor: {
      required
    },
    ZIPcode: {
      numeric
    },
    issuedDate: {
      required
    },
    selectedDoc: {
      required
    },
    selectedGroup: {
      required
    }
  },
  methods: {
    onSubmit() {
      if (this.$v.$invalid) {
        this.$v.$touch()
        return
      }
      else {
        alert('jkasdh')
      }
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