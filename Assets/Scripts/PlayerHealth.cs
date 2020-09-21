using System.Collections;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.SceneManagement;

public class PlayerHealth : MonoBehaviour
{
    public int healthenemy = 10;
    public int healthplayer = 100;
    public int sheildplayer = 100;
    public GameObject playerr;
    public GameObject enemyy;
    public GameObject dead;

    //health
    public int health_count;
    public Text healthcountimg;
    public GameObject blockhealth;
    public GameObject health_click;


    public Image pain;


    public Text count_text;

    public Slider healthbar;
    public Slider shieldbar;

    public GameObject Lose;
    public GameObject enemy_lose;
    public GameObject player_lose;
    

    private void Awake()
    {
        count_text.text = "0/8";
        gameObject.GetComponent<AudioSource>();
    }

    void Update()
    {
        if (ControlFreak2.CF2Input.GetKeyDown(KeyCode.J))
        {
            health_count -= 1;
            healthcountimg.text = health_count.ToString();
            healthplayer = 100;
            healthbar.value = healthplayer;
            if (health_count <= 0)
            {
                blockhealth.SetActive(true);
                health_click.SetActive(false);
            }
        }



    }



    public void TakeDamage()
    {
        healthenemy -= 1;
        

        if (healthenemy <= 0)
        {
            count_enemy.count += 1;
            count_text.text = count_enemy.count.ToString() + "/" + 8;
            healthenemy = 0;
            Destroy(enemyy);
            dead.SetActive(true);
            Instantiate(dead, enemyy.transform.position, enemyy.transform.rotation);
            if (count_enemy.count >= 8)
            {

            }
        }
    }

    public void TakeDamagePlayer()
    {

        sheildplayer -= 3;

        pain.gameObject.SetActive(true);

        shieldbar.value = sheildplayer;
        
        
      
        
        


        StartCoroutine(time());

        if (sheildplayer <= 0)
        {
            healthplayer -= 5;
            healthbar.value = healthplayer;
            
            
            if (healthplayer <= 0)
            {
                Lose.SetActive(true);
                player_lose.SetActive(false);
                enemy_lose.SetActive(false);
                healthplayer = 0;
                Destroy(playerr);
                Instantiate(dead, transform.position, transform.rotation);
            }
        }
    }
    public void TakeDamageRocket()
    {
        healthenemy -= 8;
        if (healthenemy <= 0)
        {
            count_enemy.count += 1;
            count_text.text = count_enemy.count.ToString() + "/" + 8;
            healthenemy = 0;
            Destroy(enemyy);
            dead.SetActive(true);
            Instantiate(dead, enemyy.transform.position, enemyy.transform.rotation);
            if (count_enemy.count >= 8)
            {

            }
        }
    }
    IEnumerator time()
    {
        yield return new WaitForSeconds(8f);
        pain.gameObject.SetActive(false);
    }

    public void Retry_Scene()
    {
        SceneManager.LoadScene("hhhhhhhhhhhh");
    }
}
