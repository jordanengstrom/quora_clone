<template>
  <nav class="navbar navbar-expand-lg navbar-light bg-light my-navbar">
    <div class="container">
      <router-link :to="{ name: 'Home' }" class="navbar-brand"
        >Que an Ayyy
      </router-link>
      <div class="collapse navbar-collapse">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item active">
            <router-link :to="{ name: 'Home' }" class="btn btn-sm btn-home btn-white-hover"
              >Home</router-link
            >
          </li>
          <li class="nav-item mx-1">
            <router-link
              :to="{ name: 'QuestionEditor' }"
              class="btn btn-sm btn-ask btn-white-hover"
              >Ask Question
            </router-link>
          </li>
          <li class="nav-item">
            <a class="btn btn-sm btn-outline-secondary btn-white-hover" href="/accounts/logout/"
              >Logout</a
            >
          </li>
        </ul>
      </div>
    </div>
  </nav>
</template>

<script>
export default {
  name: "Navbar"
};
</script>

<style scoped>
.btn-ask {
  background-color: #f9d528;
}

.btn-home {
  background-color: #7b7b78;
}

.btn-white-hover:hover {
  color: white;
}

.my-navbar {
  border-bottom: 1px solid #ddd;
}

.navbar-brand {
  font-weight: bold;
  font-size: 130%;
}

.navbar-brand:hover {
  color: #5aebfa !important;
}
</style>
