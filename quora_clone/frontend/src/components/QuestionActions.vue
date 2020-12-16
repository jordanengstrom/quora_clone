<template>
  <div class="question-actions">
    <router-link
      :to="{ name: 'QuestionEditor', params: { slug: slug } }"
      class="btn btn-bm btn-outline-secondary mr-1"
    >
      Edit Question
    </router-link>
    <button class="btn btn-bm btn-outline-danger" @click="deleteQuestion">
      Delete
    </button>
  </div>
</template>

<script>
import { apiService } from "@/common/api.service";

export default {
  name: "QuestionActions",
  props: {
    slug: {
      type: String,
      required: true
    }
  },
  methods: {
    async deleteQuestion() {
      let endpoint = `/api/questions/${this.slug}/`;
      try {
        await apiService(endpoint, "DELETE");
        this.$router.push("/");
      } catch (error) {
        // console.log(error);
      }
    }
  }
};
</script>

<style scoped>

</style>