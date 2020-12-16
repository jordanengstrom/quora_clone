<template>
  <div id="app">
    <Navbar />
    <router-view />
  </div>
</template>

<script>
import { apiService } from "@/common/api.service";
import Navbar from "@/components/Navbar";

export default {
  name: "App",
  components: {
    Navbar
  },
  methods: {
    async setUserInfo() {
      const data = await apiService("/api/user/");
      const requestUser = data["username"];
      window.localStorage.setItem("username", requestUser);
    }
  },
  created() {
    this.setUserInfo();
  }
};
</script>

<style>
html,
body {
  height: 100%;
  font-family: "Playfair Display", serif;
}
.btn:focus {
  box-shadow: none !important;
}
</style>
