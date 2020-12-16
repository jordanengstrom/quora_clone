<template>
  <div class="home">
    <div class="container">
      <div v-for="question in questions" :key="question.pk">
        <p class="mb-0">
          Posted by: <span class="question-author-name">{{ question.author }}</span>
        </p>
        <h2>
          <router-link
            :to="{ name: 'Question', params: { slug: question.slug } }"
            class="question-link"
          >
            {{ question.content }}
          </router-link>
        </h2>
        <p>Answers: {{ question.answers_count }}</p>
      </div>
      <div class="my-4">
        <p v-show="loadingQuestions">...loading...</p>
        <button
          v-show="next"
          @click="getQuestions"
          class="btn btn-sm btn-outline-success"
        >
          Load More
        </button>
      </div>
    </div>
  </div>
</template>

<script>
// @ is an alias to /src
import { apiService } from "@/common/api.service.js";
export default {
  name: "Home",
  data() {
    return {
      questions: [],
      next: null,
      loadingQuestions: false
    };
  },
  methods: {
    getQuestions() {
      let endpoint = "api/questions/";
      if (this.next) {
        endpoint = this.next;
      }
      this.loadingQuestions = true;
      apiService(endpoint).then(data => {
        this.questions.push(...data.results);
        if (data.next) {
          this.next = data.next;
        } else {
          this.next = null;
        }
      });
    }
  },
  created() {
    this.getQuestions();
    document.title = "Quora Clone";
  }
};
</script>

<style scoped>
.question-author-name {
  font-weight: bold;
  color: #dc3545;
}

.question-link {
  font-weight: bold;
  color: black;
}

.question-link:hover {
  text-decoration: none;
  color: #343a40;
}
</style>
