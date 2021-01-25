<template>
  <div class="resume">
    <client-only>
      <image-component
        imageUrl="https://drive.google.com/uc?export=download&id=1s4UFQotBl8tXuYQPbauWrIn-eR-nxyuw"
        backgroundImageUrl="https://i.pinimg.com/originals/19/d2/94/19d294b86b157c57856ecd786461b8d2.jpg"
        imageHeight="300"
        imageHeadline="CV-hero-image"
      />
    </client-only>

    <div class="row">
      <h1>Jan Novák</h1>
      <h2>Frontend developer</h2>

      <div class="col-md-8">
        <h3 class="resume-headline"># Pracovní zkušenosti</h3>

        <ul class="resume-list">
          <li
            v-for="(job, index) in resumeData.resumeJobs"
            :key="'resume-list-item-' + index"
            class="resume-list-item"
          >
            <h4 class="resume-headline">{{ job.jobHeadline }}</h4>
            <h4 class="resume-info">
              <span class="resume-info-company">{{ job.companyName }}</span>
              <span>{{ job.employmentPeriod }}</span>
            </h4>
            <p>{{ job.jobDescription }}</p>
          </li>
        </ul>

        <h3 class="resume-headline"># Vzdělání</h3>
        <ul class="resume-list">
          <li
            v-for="(educationItem, index) in resumeData.resumeEducation"
            :key="'resume-education-item-' + index"
            class="resume-list-item"
          >
            <h4 class="resume-headline">{{ educationItem.educationDescription }}</h4>
            <p>{{ educationItem.educationInstitution }}</p>
          </li>
        </ul>

        <h3 class="resume-headline"># O mně</h3>
        <!-- TODO: write there some greatness!! -->
        <p>Jsem rodinný typ, nejlépe se cítím se svojí rodinou na Praze 6. Mám rád teplé letní dny, pálivé jídlo a dobré pivo. Ve volném čase se věnuji psaní sci-fi příběhů a digitalizaci tabletop RPG her. Baví mě kvalitní literatura a filmy. Samozřejmě někdy mám i záchvaty, kdy si s radostí pustím i méně kvalitní; film a zpětně doceňuji jeho genialitu.</p>
        <p>V minulosti jsem se intenzivně věnoval streamování audiovizuálního obsahu a obecně multimédiím na internetu. Rád se hrabu ve všemožných stylech elektronické hudby a tu nejlepší si přehrávám na audio kazety. Rád roztáčím vinyly a cédéčka jako DJ. Slyšet jste mě mohli ve většině známých klubů v Praze a nejen v ní.</p>
        <p>Nemám rád sociální sítě, nekvalitní zvuk a naskakují mi pupínky ze špatného, odfláknutého kódu.</p>
      </div>

      <div class="col-md-4">
        <h3 class="resume-headline"># Dovednosti</h3>
        <div class="row">
          <div
            v-for="(overviewSkills, index) in resumeData.resumeSkillsOverview"
            :key="'resume-skills-overview-' + index"
            class="col-sm-6"
          >
            <h4>{{ overviewSkills.name }}</h4>
            <Progress
              class="vue-resume-circle-progress-bar"
              :percentage="overviewSkills.percentage"
              :type="overviewSkills.type"
              stroke-color="#00f700"
            />
          </div>
        </div>

        <h3 class="resume-headline"># Hlavní technické dovednosti</h3>

        <template
          v-for="(skill, index) in resumeData.resumeSkills"
        >
          <div
            :key="'resume-skills-' + index"
          >
            <h4>{{ skill.name }}</h4>
            <Progress
              :percentage="skill.percentage"
              :type="skill.type"
              stroke-color="#00f700"
            />
          </div>
        </template>

        <h3 class="resume-headline"># Ostatní technické dovednosti</h3>

        <template
          v-for="(otherSkill, index) in resumeData.resumeOtherSkills"
        >
          <div
            :key="'resume-other-skills-' + index"
          >
            <h4>{{ otherSkill.name }}</h4>
            <Progress
              :percentage="otherSkill.percentage"
              :type="otherSkill.type"
              stroke-color="#00f700"
            />
          </div>
        </template>
      </div>
    </div>
  </div>
</template>

<script>
import * as ResumeData from '../static/cv-data.json';

export default {
  name: 'ResumeComponent',
  data() {
    return {
      resumeData: ResumeData.default
    }
  },

  mounted() {
    import('vue-multiple-progress').then(Progress => {
      this.Progress = module.default;
    })
  }
}
</script>

<style lang="scss">
@import "../styles/variables";

.resume {
  .resume-headline {
    color: $accentColor;
  }

  .resume-list {
    list-style-type: none;
  }

  .resume-list-item {
    position: relative;

    &:before {
      content: "~";
      color: $accentColor;
      position: absolute;
      left: -20px;
      top: -3px;
    }
  }

  .resume-info {
    display: flex;
    justify-content: space-between;
  }

  .resume-info-company {
    display: block;

    &:first-letter {
      color: $accentColor;
    }
  }

  .vm-progress__text {
    color: #FFF;
  }
}
</style>
