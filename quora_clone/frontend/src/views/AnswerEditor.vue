<template>
  <div class="container mt-t">
    <h1 class="mb-3">Edit Your Answer</h1>
    <form @submit.prevent="onSubmit">
      <textarea
        v-model="answerBody"
        class="form-control"
        rows="3"
      ></textarea>
      <br />
      <button type="submit" class="btn btn-ask">Update your answer</button>
    </form>
    <p v-if="error" class="muted mt-2">{{ error }}</p>
  </div>
</template>

<script>
import { apiService } from "@/common/api.service";

export default {
  name: "AnswerEditor",
  props: {
    id: {
      type: Number,
      required: true
    }
  },
  data() {
    return {
      questionSlug: null,
      answerBody: null,
      error: null
    };
  },
  methods: {
    onSubmit() {
      if (this.answerBody) {
        let endpoint = `/api/answers/${this.id}/`;
        apiService(endpoint, "PUT", { body: this.answerBody }).then(() => {
          this.$router.push({
            name: "Question",
            params: { slug: this.questionSlug }
          });
        });
      } else {
        this.error = "You can't submit an empty answer!";
      }
    }
  },
  async beforeRouteEnter(to, from, next) {
    let endpoint = `/api/answers/${to.params.id}/`;
    let data = await apiService(endpoint);
    return next(vm => ((vm.answerBody = data.body), (vm.questionSlug = data.question_slug)));
  }
};
</script>

<style scoped>
.btn-ask {
  background-color: #f9d528;
}

.btn-ask:hover {
  color: white;
}
</style>
