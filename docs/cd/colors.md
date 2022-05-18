# Colors

## DBP ColorSytstem

<styles> 
    .colorbox{
        width: 10px;
        height: 10px;
        color: white;
        border: 1px solid black;
        display: inline-block;
        margin-right: 10px;
    }
</styles>

| Name               | Variable                            | Color | 
| ------------------ | ----------------------------------- | ----- |
| Background         |`--dbp-override-background`          | <div style="width: 10px; height: 10px; background: white;border: 1px solid black;display: inline-block;margin-right: 10px;"></div>`#ffffff` |
| Content            |`--dbp-override-content`             | <div style="width: 10px; height: 10px; background: #222120;border: 1px solid black;display: inline-block;margin-right: 10px;"></div>`#222120` |
| Content surface    |`--dbp-override-content-surface`     | `--dbp-override-content` |
| On content surface |`--dbp-override-on-content-surface`  | `--dbp-override-background` |
| |
| Border             | `--dbp-override-border`             | `1px solid #000000` |
| Border radius      | `--dbp-override-border-radius`      | `0px` |
|   |
| Primary            | `--dbp-override-primary`            | <div style="width: 10px; height: 10px; background: #3775c1;border: 1px solid black;display: inline-block;margin-right: 10px;"></div>`#3775c1`
| Primary surface    | `--dbp-override-primary-surface`    | `--dbp-override-primary` |
| On primary surface | `--dbp-override-on-primary-surface` | `--dbp-override-on-content-surface` |
| Primary surface border color | `--dbp-override-primary-surface-border-color` | `--dbp-override-primary-surface` |
| |
| Secondary            | `--dbp-override-secondary`            | <div style="width: 10px; height: 10px; background: #222120;border: 1px solid black;display: inline-block;margin-right: 10px;"></div>`#222120`
| Secondary surface    | `--dbp-override-secondary-surface`    | <div style="width: 10px; height: 10px; background: white;border: 1px solid black;display: inline-block;margin-right: 10px;"></div>`#ffffff` |
| On secondary surface | `--dbp-override-on-secondary-surface` | `--dbp-override-on-content-surface` |
| Secondary surface border color | `--dbp-override-secondary-surface-border-color` | `--dbp-override-secondary-surface` |
| |
| Muted              |`--dbp-override-muted`               | <div style="width: 10px; height: 10px; background: #767676;border: 1px solid black;display: inline-block;margin-right: 10px;"></div>`#767676` |
| Muted surface      |`--dbp-override-muted-surface`       | `--dbp-override-muted` |
| On muted surface   |`--dbp-override-on-muted-surface`    | `--dbp-override-on-content-surface` |
| Muted surface border color | `--dbp-override-muted-surface-border-color` | `--dbp-override-muted-surface` |
| |
| Accent            |`--dbp-override-accent`               |  <div style="width: 10px; height: 10px; background: #9e1e4d;border: 1px solid black;display: inline-block;margin-right: 10px;"></div>`#9e1e4d` |
| Accent surface    |`--dbp-override-accent-surface`       | `--dbp-override-accent` |
| On accent surface |`--dbp-override-on-accent-surface`    | `--dbp-override-on-content-surface` |
| Accent surface border color | `--dbp-override-accent-surface-border-color` | `--dbp-override-accent-surface` |
| |
| Info            |`--dbp-override-info`                   | <div style="width: 10px; height: 10px; background: #38808a;border: 1px solid black;display: inline-block;margin-right: 10px;"></div>`#38808a` |
| Info surface    |`--dbp-override-info-surface`           | `--dbp-override-info` |
| On info surface |`--dbp-override-on-info-surface`        | `--dbp-override-on-content-surface` |
| Info surface border color | `--dbp-override-info-surface-border-color` | `--dbp-override-info-surface` |
| |
| Success            |`--dbp-override-success`             | <div style="width: 10px; height: 10px; background: #338555;border: 1px solid black;display: inline-block;margin-right: 10px;"></div>`#338555` |
| Success surface    |`--dbp-override-success-surface`     | <div style="width: 10px; height: 10px; background: #5ec189;border: 1px solid black;display: inline-block;margin-right: 10px;"></div>`#5ec189` |
| On success surface |`--dbp-override-on-success-surface`  |  <div style="width: 10px; height: 10px; background: #222120;border: 1px solid black;display: inline-block;margin-right: 10px;"></div>`#222120` |
| Success surface border color | `--dbp-override-success-surface-border-color` | `--dbp-override-success-surface` |
| |
| Warning            |`--dbp-override-warning`             |  <div style="width: 10px; height: 10px; background: #bf8808;border: 1px solid black;display: inline-block;margin-right: 10px;"></div>`#bf8808` |
| Warning surface    |`--dbp-override-warning-surface`     |  <div style="width: 10px; height: 10px; background: #f9cc66;border: 1px solid black;display: inline-block;margin-right: 10px;"></div>`#f9cc66` |
| On warning surface |`--dbp-override-on-warning-surface`  |  <div style="width: 10px; height: 10px; background: #222120;border: 1px solid black;display: inline-block;margin-right: 10px;"></div>`#222120` |
| Warning surface border color | `--dbp-override-warning-surface-border-color` | `--dbp-override-warning-surface` |
| |
| Danger            |`--dbp-override-danger`               | <div style="width: 10px; height: 10px; background: #cc3232;border: 1px solid black;display: inline-block;margin-right: 10px;"></div>`#cc3232` |
| Danger surface    |`--dbp-override-danger-surface`       | `--dbp-override-danger` |
| On danger surface |`--dbp-override-on-danger-surface`    | `--dbp-override-on-content-surface` |
| Danger surface border color | `--dbp-override-danger-surface-border-color` | `--dbp-override-danger-surface` |
| |
| Hover Background Color | `--dbp-override-hover-background-color` | not set |
| Hover color            | `--dbp-override-hover-color`            | not set |


## Print Colors
**Content Color:**

<div>True black <div style="width: 20px; height: 20px; background: #000000 ;border: 1px solid black;display: inline-block;margin-left : 10px;"></div></div>
`76% Cyan | 70% Magenta | 64% Yellow | 89% Black`

**Background Color:**

<div>White<div style="width: 20px; height: 20px; background: #ffffff;border: 1px solid black;display: inline-block;margin-left: 10px;"></div></div>
`0% Cyan | 0% Magenta | 0% Yellow | 0% Black`

**Accent Colors:**
<div>Berry<div style="width: 20px; height: 20px; background: #a12057;border: 1px solid black;display: inline-block;margin-left: 10px;"></div></div>
`20% Cyan | 100% Magenta | 30% Yellow | 20% Black`

<div>Cobalt<div style="width: 20px; height: 20px; background: #3970b2;border: 1px solid black;display: inline-block;margin-left: 10px;"></div></div>div>
`80% Cyan | 50% Magenta | 0% Yellow | 0% Black`
