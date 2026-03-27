#import "./ilm/lib.typ": *

#set text(lang: "en")

#show: ilm.with(
  title: [
    'Changing the Subject'
  ],
  subtitle: [Issue Priming, Valence Competition, and the Stoltenberg Effect in the 2025 Norwegian Parliamentary Election],
  author: "Julien Ribiollet",
  date: datetime(year: 2025, month: 11, day: 21),
  abstract: [
  ],
  figure-index: (enabled: false),
  table-index: (enabled: false),
  listing-index: (enabled: false),
  external-link-circle: false,
  appendix: (
    enabled: true,
    body: [
      = GPT-5.4 prompt for Aftenposten content analysis

      #raw(
        block: true,
        "You are a research assistant helping me code Norwegian newspaper articles for a political science content analysis of the 2025 Norwegian parliamentary election. I will paste Norwegian-language article headlines and text from Aftenposten. For each article I paste, please return the following in **exactly this format** (so I can copy it into my spreadsheet):

        ```
        NEWSPAPER: [Aftenposten - write this everytime]
        CONCERNS_NORWAY: [YES or NO - if the article is linked to Norway, Norway politics, international relations that include Norway, Norway positions, Norway domestic activities, ...]
        PUBLICATION_DATE: [Formatted as 2025-01-25]
        SECTION_NO: [As written at the bottom of the article, ex. Ideer & Samfunn]
        HEADLINE_NO: [original Norwegian headline, exactly as written]
        HEADLINE_EN: [English translation of the headline]
        LEAD_EN: [English translation/summary of the first 1-2 sentences, max 2 lines]
        ISSUE_CODE: [primary issue code — one of: IMM, ECON, SEC, GOV, TAX, GAZ, CLI, HEA, OTH]
        ISSUE_CODE_2: [secondary issue code if the article clearly spans two categories, otherwise leave blank]
        MENTIONS_STOLTENBERG: [YES or NO — does the article mention Jens Stoltenberg?]
        MENTIONS_LISTHAUG: [YES or NO — does the article mention Sylvi Listhaug?]
        MENTIONS_SOLBERG: [YES or NO — does the article mention Erna Solberg?]
        TONE_AP: [Tone toward Labour/Arbeiderpartiet: POS if favourable, NEG if critical, NEU if neutral/factual]
        BRIEF_JUSTIFICATION: [One sentence explaining why you chose this issue code]
        ```

        Here are the issue categories and their definitions:

        | Code | Category | What it covers |
        |---|---|---|
        | **IMM** | Immigration / Integration / Crime | Immigration policy, asylum, integration, immigrant-related crime, gang violence, deportation |
        | **ECON** | Cost-of-living / Energy prices / Economy | Electricity prices, inflation, interest rates, purchasing power, economic hardship, Norgespris |
        | **SEC** | Security / Defence / Foreign Policy / NATO | NATO, Russia, Ukraine, Trump/US, defence spending, Norway's international role |
        | **GOV** | Governance / Competence / Leadership | Government formation, cabinet changes, PM performance, political trust, coalition dynamics, polls/horse-race |
        | **TAX** | Wealth tax / Inequality / Redistribution | Wealth tax debate, tax flight to Switzerland, inequality, redistribution |
        | **GAZ** | Gaza / Sovereign Wealth Fund / Palestine | Sovereign fund investments in Israel, Gaza war, divestment demands |
        | **CLI** | Climate / Environment / Oil policy | Climate policy, oil exploration, green transition, deep-sea mining |
        | **HEA** | Health / Welfare / Public services | Hospitals, healthcare, schools, welfare state, pensions |
        | **OTH** | Other | Doesn't fit above categories |

        **Coding rules:**
        - Code based on the PRIMARY issue. If the article touches multiple issues, choose the dominant one for ISSUE_CODE and optionally note a second in ISSUE_CODE_2.
        - If an article is about Stoltenberg personally (his appointment, his popularity), code as GOV unless the substance is about a specific policy domain (e.g., his views on defence → SEC, his tax policy → TAX).
        - Articles about polls, election predictions, or party strategy with no specific issue → GOV.
        - Articles about coalition negotiations → GOV.
        - TONE_AP: POS = article frames Labour/Støre/Stoltenberg favourably (e.g., rising polls, successful policy); NEG = article is critical of Labour (e.g., scandals, failures); NEU = factual reporting without clear positive/negative framing.

        Example:
        ```
        NEWSPAPER: Aftenposten
        CONCERNS_NORWAY: YES
        PUBLICATION_DATE: 2025-02-05
        SECTION_NO: Nyheter
        HEADLINE_NO: Hvor mye endte i sjøen? Det er det ingen som vet.
        HEADLINE_EN: How much ended up in the sea? No one knows.
        LEAD_EN: The U.S. Navy did not notify Norwegian authorities after losing cargo during a visit to Norway, and because military vessels are exempt from reporting rules, nobody knows exactly how much ended up in the sea.
        ISSUE_CODE: CLI
        ISSUE_CODE_2: SEC
        MENTIONS_STOLTENBERG: NO
        MENTIONS_LISTHAUG: NO
        MENTIONS_SOLBERG: NO
        TONE_AP: NEU
        BRIEF_JUSTIFICATION: The article is primarily about marine pollution and weak environmental accountability after cargo from a U.S. warship entered Norwegian waters, with a secondary security/defence context.
        ```

        **Important:** Keep translations accurate but concise. For LEAD_EN, summarize rather than translate word-for-word — I need to understand the gist in 1-2 sentences. Always respond in the exact format above so I can easily copy each field into my Excel sheet.

        Put the result in a code block so I can easily copy paste the outcome.
        I will now start pasting articles. Please process each one I send.",
      )
    ],
  ),
)

#set text(lang: "en")

= Introduction

On 4 February 2025, Norwegian Prime Minister Jonas Gahr Støre appointed former NATO Secretary General Jens Stoltenberg as Minister of Finance, days after the Centre Party quit the governing coalition over EU energy policy @KAS_2025. Labour (Ap) was polling below 20% and headed for defeat; the Progress Party (FrP) and the Conservatives (Hoyre) dominated the agenda on immigration, crime, and cost of living @PollOfPolls_2025. Seven months later, for the 2025 parliamentary election, Labour won 28.0% of the vote and secured a second term, while Hoyre collapsed to 14.6%, its worst result since 2005 @NorwegianElectoralDirectorate_2025. What exactly happened?

This paper argues that the Stoltenberg appointment functioned as a priming event that shifted the salient issue terrain away from position issues owned by the radical right and toward valence issues on which Labour could claim superior competence. Therefore, we ask the following question: *Did the Stoltenberg appointment shift media attention from FrP-owned issues (immigration, cost of living) toward Labour-owned issues (security, governance), and did this shift coincide with Labour's polling recovery?* The argument chains three campaign election mechanisms: issue ownership @petrocik_1996 @budge_farlie_1983, media priming @iyengar_kinder_1987, and valence competition @stokes_1963 @adams_merrill_2009.

To test these claims, I conducted a content analysis of news articles from Aftenposten, Norway's larget printed newspaper by circulation and considered Norway's "newspaper of record", across three periods (before the appointment, after it, and before the election), supplemented by Google Trends data for search terms mapped to FrP-owned and Labour-owned issues. I put these findings in perspective with the data of a Norwegian election study on voters agenda @bergh_hesstvedt_karlsen_2025 to finally come to a conclusion.

#figure(
  image("images/norwegian-political-landscape.png", width: 60%),
  caption: [Norway's political parties running for the parliamentary election of September 2025. Source: _The Norwegian Election Explained_ by Milie Nancy Eiken, October 7, 2025. Alfaskolen.],
) <fig:political-parties>

= Literature review and theoretical framework

== Issue ownership and the saliency theory of party competition

The starting point for this analysis is the saliency theory of party competition, which holds that parties compete not by confronting each other on the same issues but by selectively emphasizing the topics on which they enjoy a reputational advantage @budge_farlie_1983. Petrocik formalized this insight as *issue ownership*: the idea that voters associate certain policy domains with certain parties, based on historical track records and perceived competence @petrocik_1996. For example, when a U.S. election is fought on Republican-owned issues, Republicans do well; when it is fought on Democratic-owned ones, Democrats benefit. Aggregate election results can be predicted, to a significant extent, by the salience of different issue categories during the campaign.

Van der Brug extended this to multiparty systems, showing that the effect of issue salience on party choice operates partly indirectly: by emphasizing certain issues, parties shift their perceived ideological position, which affects voter preferences via proximity @van_der_brug_2004. Even a small shift in the issue terrain can alter the perceived profile of competing parties.

Applied to Norway in 2025: before the Stoltenberg appointment, salient issues were immigration, crime, and energy prices, all classic FrP-owned domains. This Norwegian election study on issue ownsership @bergh_hesstvedt_karlsen_2025 confirms that FrP held the strongest ownership on immigration, which grew in importance between 2021 and 2025. Labour held ownership of health policy and shared ownership of tax and defence. The appointment placed a former NATO chief at the centre of government during acute geopolitical tension, creating conditions for the agenda to shift toward security and governance, where Labour's credibility was strong.

== Media priming and the evaluation of parties

Issue ownership explains _which_ parties benefit when a given issue is salient; *priming* theory explains _how_ salience is shaped. Iyengar and Kinder demonstrated experimentally that television news coverage affects not just what viewers think _about_ but what they think _with_ when evaluating political leaders @iyengar_kinder_1987. By devoting sustained attention to a particular problem, news media alter the criteria voters use to judge candidates and parties. Their 1980 case study showed that intensive coverage of the Iranian hostage crisis in the final days of the presidential campaign primed voters to evaluate Carter on foreign policy performance, likely contributing to his defeat.

The priming mechanism has a clear implication: if the appointment generated sustained media coverage of security, defence, and leadership competence, it would change the evaluative criteria voters applied to all parties. Voters would judge Labour not on its handling of electricity prices but on its capacity to manage Norway's security relationships. As Chong and Druckman note, priming effects have typically been studied in non-competitive settings @chong_druckman_2007. The Norwegian case is interesting precisely because it may involve a deliberate attempt to shift the terms of competition.

== Valence competition and the competence signal

A third building block concerns the distinction between position and *valence* issues. Stokes noted that many political conflicts concern not policy direction but competence in pursuing shared goals @stokes_1963. On valence issues, voters ask 'which party can deliver?' rather than 'which party agrees with me?'. Adams and Merrill formalized this for multiparty proportional representation systems, showing that parties whose valence image improves enjoy electoral gains independent of policy positions @adams_merrill_2009.

The Stoltenberg appointment was, above all, a valence signal. It told voters that Labour could attract a leader of international stature to manage the economy at a moment of geopolitical uncertainty. It did not change Labour's policy platform but it changed the dimension on which Labour was being evaluated. The appointment shifted competition from a position-issue terrain ('where do you stand on immigration?') to a valence-issue terrain ('who do you trust to govern?'). It redirected the 'tunnel of attention' @grossman_2025 toward Labour-friendly ground, offering the party an alternative to the classic strategies of accommodation, adversarial engagement, or dismissal when facing a challenger party's issues @meguid_2005.

This leads to two testable hypotheses:

- *H1 (Priming):* The Stoltenberg appointment shifted media coverage from FrP-owned issues (immigration, cost of living) toward Labour-owned issues (security, governance).

- *H2 (Electoral coincidence):* This shift in issue salience coincided with Labour's polling recovery and the right-wing bloc's relative decline.

The following sections present the data, methods, and results used to test these hypotheses.

= Data and methods

#figure(
  image("images/methodology.svg", width: 95%),
  caption: [Data collection and analysis methodology.],
) <fig:methodology>

== Newspaper content analysis

The primary dataset is a content analysis of Aftenposten, Norway's newspaper of record. I accessed the archive through Sciences Po's PressReader subscription, which provides full digital editions but no downloadable dataset or API. For each issue, I read every article in the _Nyheter_ (News) and _Forord_ (Foreword) sections, excluding specialised supplements (Culture, Sport, Opinion).

Each article was then fed to a custom GPT-5.4 agent (see Appendix A for initial prompt). The agent returned a standardised output including: date, headline (Norwegian and English), lead summary, primary and secondary issue codes, mentions of key party figures (Stoltenberg, Listhaug, Solberg), and tone toward Labour (positive, neutral, negative). I assembled these outputs into daily text files, then parsed and validated the dataset using Python.#footnote[All replication code and the coding prompt are available at: https://github.com/4rtamis/norway-2025-election.]

I grouped articles across three observation windows defined around the date of 4 February 2025 (Stoltenberg's appointment as minister): _Before_ (mid-January to 4 February, $n = 234$), _After_ (6 February to early March, $n = 216$), and _Election_ (late August to the election day of 8 September, $n = 222$), plus 14 articles published on the appointment day itself. The analysis sample totals 686 articles across 54 daily newspaper issues. Because articles frequently span two issue categories, I included secondary issue codes with equal weighting, yielding 1100 article-issue observations.

Articles were classified into nine issue categories, then grouped into issue ownership clusters for hypothesis testing (@tbl:codes).

The methodology is summarised in @fig:methodology.

#figure(
  table(
    columns: (1fr, 2.5fr, 1.2fr),
    inset: 6pt,
    align: (center, left, center),
    stroke: 0.5pt + luma(180),
    table.header([*Code*], [*Category*], [*Issue group*]),
    [IMM], [Immigration, integration, crime], [FrP-owned],
    [ECON], [Cost of living, energy prices, economy], [FrP-owned],
    [SEC], [Security, defence, foreign policy, NATO], [Labour-owned],
    [GOV], [Governance, competence, leadership], [Labour-owned],
    [TAX], [Wealth tax, inequality, redistribution], [Contested],
    [GAZ], [Gaza, sovereign wealth fund], [Left-niche],
    [CLI], [Climate, environment, oil policy], [Left-niche],
    [HEA],
    [Health, welfare, public services],
    [Left-niche #footnote[This category includes health policy, which is a traditional Labour-owned issue, but also welfare and public services more broadly, which have become contested terrain in recent years. Since this paper focuses on the Stoltenberg-Effect which is primarily about security and governance, I chose to group HEA with other left-niche issues rather than with Labour-owned ones.]],

    [OTH], [Other], [Other],
  ),
  caption: [Issue coding scheme and theoretical groupings.],
) <tbl:codes>

== Google Trends

As a supplementary measure, I collected weekly Google Trends data (geo: Norway, January to September 2025) for search terms mapped to each issue group: _innvandring_, _strompris_, and _kriminalitet_ (FrP-owned); _Stoltenberg_, _NATO_, and _forsvar_ (Labour-owned); _formuesskatt_ (Contested); plus _Listhaug_ as a control for FrP leader visibility.


= Results and discussion

== Issue group dynamics

@fig:issue-group-shift and @tbl:results report the distribution of issue groups. The clearest pattern is the steady decline of FrP-owned issues (IMM + ECON): from 22.0% before the appointment to 17.4% after, and 13.3% by the election ($-$8.7pp overall). The Z-test for proportions finds this Before-to-Election drop significant ($z = 3.15$, $p = 0.002$), but the Before-to-After shift alone is not ($z = 1.54$, $p = 0.12$). Labour-owned issues (SEC + GOV) held a dominant but stable share: 45.7% before, 40.8% after, 45.6% by the election. Left-niche issues (CLI + GAZ + HEA) rose steadily from 16.3% to 24.3% ($z = 2.77$, $p = 0.006$), reflecting health and climate coverage that grew throughout 2025.


#figure(
  image("images/fig5_repriming_slope.png", width: 95%),
  caption: [Issue group shares by period.],
) <fig:issue-group-shift>

#figure(
  image("images/fig9_daily_all_groups.png", width: 95%),
  caption: [Daily issue group shares.],
) <fig:daily-all-groups>

#figure(
  table(
    columns: (1fr, 0.8fr, 0.8fr, 0.9fr, 0.8fr),
    inset: 5pt,
    align: (left, center, center, center, center),
    stroke: 0.5pt + luma(180),
    table.header([*Issue group*], [*Before (%)*], [*After (%)*], [*Election (%)*], [*$Delta$ B $arrow$ E (pp)*]),
    [FrP-owned (IMM+ECON)], [22.0], [17.4], [13.3], [-8.7\*\*],
    [Labour-owned (SEC+GOV)], [45.7], [40.8], [45.6], [-0.1],
    [Contested (TAX)], [2.0], [0.6], [3.6], [+1.6],
    [Left-niche (CLI+GAZ+HEA)], [16.3], [19.8], [24.3], [+8.0\*\*],
    [Other], [14.1], [21.3], [13.3], [-0.8],
    table.hline(),
    [_N (article-issue obs.)_], [_405_], [_333_], [_362_], [],
  ),
  caption: [Issue group shares by period. Z-tests (Before vs Election): \*\* $p < 0.01$.],
) <tbl:results>



H1 thus receives partial support. The issue terrain shifted away from FrP-owned themes, but gradually rather than as a sudden repriming. The appointment likely initiated a process that unfolded over months as Stoltenberg's presence kept security and governance in the news cycle.

== Individual issue codes

@fig:daily-individual-groups and @tbl:issues breaks down results by individual code. The dominant story is the collapse of ECON (cost of living): 16.5% to 13.5% to 8.0%, the only code reaching high significance ($z = 3.56$, $p < 0.001$). Immigration (IMM) remained low (5.4% to 3.9% to 5.2%), never becoming the dominant theme that pre-election polls anticipated. GOV was the single largest category at 28.4% before, dipped to 24.0% after (when Stoltenberg coverage was at its peak), then returned to 28.7%. SEC was remarkably stable at ~17% across all windows, suggesting defence had become a structural feature of the news agenda before the appointment. Among smaller categories, HEA rose from 10.1% to 14.9% ($z = 2.01$, $p = 0.044$), and TAX, nearly absent after the appointment (0.6%), surged to 3.6% before the election ($z = 2.71$, $p = 0.007$).

#figure(
  image("images/fig10_daily_all_issues.png", width: 95%),
  caption: [Daily individual issue shares.],
) <fig:daily-individual-groups>

#figure(
  table(
    columns: (1fr, 0.7fr, 0.7fr, 0.7fr, 0.7fr, 0.7fr, 0.7fr),
    inset: 4.5pt,
    align: (left, center, center, center, center, center, center),
    stroke: 0.5pt + luma(180),
    table.header([*Issue*], [*Bef. (n)*], [*Bef. (%)*], [*Aft. (n)*], [*Aft. (%)*], [*Elec. (n)*], [*Elec. (%)*]),
    [GOV], [115], [28.4], [80], [24.0], [104], [28.7],
    [SEC], [70], [17.3], [56], [16.8], [61], [16.9],
    [ECON], [67], [16.5], [45], [13.5], [29], [8.0\*\*\*],
    [HEA], [41], [10.1], [36], [10.8], [54], [14.9\*],
    [IMM], [22], [5.4], [13], [3.9], [19], [5.2],
    [CLI], [15], [3.7], [20], [6.0], [19], [5.2],
    [GAZ], [10], [2.5], [10], [3.0], [15], [4.1],
    [TAX], [8], [2.0], [2], [0.6], [13], [3.6],
    [OTH], [57], [14.1], [71], [21.3], [48], [13.3],
    table.hline(),
    [*Total*], [*405*], [*100*], [*333*], [*100*], [*362*], [*100*],
  ),
  caption: [Individual issue code distribution. Significance (Before vs Election): \* $p < 0.05$, \*\*\* $p < 0.001$.],
) <tbl:issues>


The daily time series on @fig:daily-individual-groups show that the GOV spike around 4-5 February was sharp but brief, while the ECON decline was continuous through spring and summer. SEC remained a steady second-rank issue across the entire period, never spiking but never disappearing.

== Leader visibility

#figure(
  image("images/fig3_leader_mentions.png", width: 95%),
  caption: [Daily individual issue shares.],
) <fig:leader-mentions>

As displayed on @fig:leader-mentions, Stoltenberg was mentioned in a large share of After-period articles, as expected following a major reshuffle. Listhaug and Solberg mentions rose only during the election period where Stoltenberg reaches similar shares while not being the head of Labour (this role belongs to Jonas Gahr Støre). This confirms that the post-appointment news cycle was dominated by Stoltenberg's persona, though this visibility measure is descriptive and does not isolate issue priming from name recognition.

== Google Trends and the Norwegian Election Study

Google Trends (@fig:google-trends) show a Stoltenberg search spike in the week of 4 February (index: 11 to 100) and a rise in 'NATO' (17.5 to 32.2). _Strompris_ (energy price) declined from 36 to 21 by the election. The election period was however dominated by _formuesskatt_ (wealth tax) (7 to 31) and _Listhaug_ (13 to 65), reflecting the late-campaign tax debate.

#figure(
  image("images/google_trends.png", width: 95%),
  caption: [Google Trends in Norway with 8 keywords associated with issue ownership by Ap and FrP.],
) <fig:google-trends>

Put in perspective with the Norwegian election study @bergh_hesstvedt_karlsen_2025, foreign and defence policy rose from 1% of voters' priorities in 2021 to 15% in 2025 (+14pp), the largest increase of any issue. Taxes surged to 25% (+7pp), while immigration rose modestly to 11%. Bergh et al. note that FrP strengthened its ownership across many domains, even surpassing Hoyre. The problem for the right-wing bloc was not ownership but salience: FrP owned immigration, but the election was about taxes, security, and governance.

== Limitations

The content analysis relies on a single newspaper dataset elaborated with LLM assistance. Translation and AI bias are completely ignored and while the sample provides adequate power for Before-to-Election comparisons, it falls short for the narrower Before-to-After window. Extending to other media sources like NRK or VG would strengthen the evidence but requires archival access currently unavailable.

= Conclusion

This paper asked whether the Stoltenberg appointment shifted the issue terrain of the 2025 Norwegian election. The content analysis shows a significant decline of FrP-owned issue coverage across the campaign and a stable dominance of Labour-owned themes, but the shift was gradual rather than sudden. The appointment did not reprime the election overnight; it likely initiated a slower process through which the security and competence frame became self-reinforcing. The theoretical contribution connects issue ownership @petrocik_1996, priming @iyengar_kinder_1987, and valence competition @adams_merrill_2009: a personnel decision redirected the 'tunnel of attention' @grossman_2025 from position issues where FrP excelled to valence issues where Labour was stronger.

// Bibliography
#pagebreak()

#bibliography("refs.bib", style: "chicago-author-date")
