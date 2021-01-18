<template>
  <div class="resume">
    <div class="row">
      <h1>Jan Novák</h1>
      <h2>Frontend developer</h2>

      <div class="col-md-8">
        <h3 class="resume-headline"># Pracovní zkušenosti</h3>

        <template
          v-for="jobs in resumeData.resumeJobs"
        >

        </template>

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

        <h3 class="resume-headline">O mně</h3>
        <!-- TODO: write there some greatness!! -->
        <p>Kromě psaní kódu a vývoje webových aplikací se nejlépe cítím se svojí rodinou na Praze 6. Mám rád teplé letní dny, pálivé jídlo a dobré pivo. Ve volném čase se věnuji psaní sci-fi příběhů a digitalizaci tabletop RPG her. Baví mě kvalitní literatura nebo filmy. Samozřejmě někdy mám i záchvaty, kdy si s radostí pustím i špatný film a zpětně doceňuji jeho genialitu.</p>
        <p>V minulosti jsem se intenzivně věnoval streamování audiovizuálního obsahu a obecně multimédiím na internetu. Jsem DJ na volné noze hrající více hudebních stylů.</p>
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
import Progress from 'vue-multiple-progress';
import * as ResumeData from '../static/cv-data.json';

export default {
  name: 'ResumeComponent',
  components: {
    Progress
  },

  data() {
    return {
      resumeData: ResumeData.default
    }
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
